# Re-analysis of Batool et al. (2026) hydration, elasticity and roughness (Analyses 2 and 4).
#
# Run from the repository root:   Rscript analysis/batool-reanalysis.R
# Writes analysis/batool-results.txt.
#
# Inputs
#   data/batool-2026/figure-values.csv  study-level SMDs and 95% CIs exactly as printed in Batool's
#                                       Figures 5 (elasticity) and 8 (roughness).
#   data/batool-2026/figure-values-hydration.csv  the same for Figure 4 (hydration).
#   data/batool-2026/re-extraction.csv  every one of those rows re-extracted from the original trial
#                                       papers (source page and table, inputs, and how Batool's printed
#                                       value arises), plus the two week-12 rows Batool removed as
#                                       "extreme negative outliers" (Supplementary Figure S2A: Yoon 2014,
#                                       Zmitek 2020), the Seong 2024 week-12 row Batool omitted, and the
#                                       two hydration rows Batool removed as outliers (Figure S1A:
#                                       Morakul 2024, Koizumi 2017).
#
# Steps
#   1. Reproduce Batool's printed pooled results and weekly subtotals from their own values (stop if not).
#   2. Analysis 2: elasticity and roughness pooled from the re-extracted values. Primary: endpoint SMD
#      wherever the trial reports endpoint values, change-score SMD only where it reports nothing else
#      (Lee 2023 elasticity and roughness, Koizumi, Yoon). The Cochrane Handbook (10.5.2) advises against mixing final-value and
#      change-score SMDs, so this keeps nearly all rows on one basis; sensitivity analyses drop the
#      change-only rows, use change scores wherever available, and use the row-by-row choices in best_g.
#      Hydration also gets a sensitivity reading Yoon's unlabelled error bars as 95% CIs instead of SEMs.
#   3. Analysis 4: the same, restricted to trials where collagen was the only active ingredient that
#      differed between arms.
#
# Model: random effects, restricted maximum likelihood (REML). Study-level standard errors are recovered
# from 95% CIs (width / 3.92). Multilevel models nest rows (time points, Inoue's two arms) within trial;
# sampling errors are treated as independent, so a cluster-robust CI by trial is also reported.

suppressMessages(library(metafor))
if (!file.exists("data/batool-2026/figure-values.csv"))
  stop("Run this script from the repository root (the folder that contains data/ and analysis/).")
fv <- rbind(read.csv("data/batool-2026/figure-values.csv", stringsAsFactors = FALSE),
            read.csv("data/batool-2026/figure-values-hydration.csv", stringsAsFactors = FALSE))
fv$vi <- ((fv$ub - fv$lb) / (2 * qnorm(0.975)))^2
rx <- read.csv("data/batool-2026/re-extraction.csv", stringsAsFactors = FALSE)
rx$trial <- sub(" \\(.*", "", rx$trial)               # "Kim 2018 (identified ...)" -> "Kim 2018"
# Sugihara 2015 and Inoue 2016 report an identical placebo arm, so they are one cohort for clustering.
rx$cohort <- ifelse(rx$trial %in% c("Sugihara 2015", "Inoue 2016"), "Inoue 2016 / Sugihara 2015", rx$trial)
gvar <- function(g, n1, n2) (n1 + n2) / (n1 * n2) + g^2 / (2 * (n1 + n2))   # large-sample SMD variance
basis <- function(x, which) {
  x$smd <- switch(which,
    endpoint = ifelse(!is.na(x$endpoint_g), x$endpoint_g, x$change_g),
    change   = ifelse(!is.na(x$change_g), x$change_g, x$endpoint_g),
    best     = x$best_g)
  x$vi <- if (which == "best") ((x$best_ub - x$best_lb) / (2 * qnorm(0.975)))^2 else gvar(x$smd, x$n1, x$n2)
  x
}

out <- file("analysis/batool-results.txt", open = "wt")
say <- function(...) { txt <- sprintf(...); cat(txt, "\n", sep = ""); cat(txt, "\n", sep = "", file = out) }
uni <- function(x) rma(yi = smd, vi = vi, data = x, method = "REML")
ml  <- function(x) { x$row <- seq_len(nrow(x)); rma.mv(yi = smd, V = vi, random = ~ 1 | cohort / row, data = x, method = "REML") }
show <- function(lab, x) {
  m <- uni(x)
  say("  %-70s %5.2f (95%% CI %5.2f to %5.2f), p = %.2g, I2 = %2.0f%%, k = %2d rows, %2d trials",
      lab, m$b[1], m$ci.lb, m$ci.ub, m$pval[1], m$I2, m$k, length(unique(x$trial)))
  invisible(m)
}
showml <- function(lab, x) {
  m <- ml(x); r <- robust(m, cluster = x$cohort)
  say("  %-70s %5.2f (95%% CI %5.2f to %5.2f); cluster-robust CI %5.2f to %5.2f, %2d independent cohorts",
      lab, m$b[1], m$ci.lb, m$ci.ub, r$ci.lb, r$ci.ub, length(unique(x$cohort)))
}

# ---- 1. reproduce Batool's printed results ------------------------------------------------------
say("== Step 1: reproduce Batool's printed results from their own study-level values ==")
printed <- data.frame(
  o  = c(rep("hydration", 5), rep("elasticity", 4), rep("roughness", 5)),
  w  = c(NA, 2, 4, 8, 12, NA, 4, 8, 12, NA, 4, 6, 8, 12),
  b  = c(0.44, 0.08, 0.79, 0.34, 0.34, 0.62, 0.04, 0.17, 1.35, -0.57, -0.24, -0.57, -0.36, -1.25),
  lb = c(0.15, -0.35, 0.33, -0.52, 0.06, 0.15, -0.49, -0.14, 0.48, -1.06, -0.69, -0.87, -0.89, -3.02),
  ub = c(0.73, 0.51, 1.25, 1.21, 0.63, 1.10, 0.57, 0.47, 2.22, -0.08, 0.21, -0.28, 0.18, 0.51))
for (j in seq_len(nrow(printed))) {
  x <- fv[fv$outcome == printed$o[j] & (is.na(printed$w[j]) | fv$week %in% printed$w[j]), ]
  m <- uni(x)
  ok <- all(abs(c(m$b[1], m$ci.lb, m$ci.ub) - unlist(printed[j, c("b", "lb", "ub")])) <= 0.011)
  say("  %-10s %-8s ours %5.2f (%5.2f, %5.2f) | printed %5.2f (%5.2f, %5.2f) %s", printed$o[j],
      if (is.na(printed$w[j])) "overall" else paste("week", printed$w[j]),
      m$b[1], m$ci.lb, m$ci.ub, printed$b[j], printed$lb[j], printed$ub[j], if (ok) "match" else "MISMATCH")
  if (!ok) stop("Batool's printed result was not reproduced: ", printed$o[j], " ", printed$w[j])
}

say("")
say("Row verdicts (column 'verdict' in re-extraction.csv; Batool's plotted rows, then the rows Batool removed or omitted):")
rx$set <- ifelse(grepl("^S1A|^S2A", rx$batool_label), "removed", ifelse(grepl("omitted", rx$batool_label), "omitted", "plotted"))
vt <- with(rx, table(paste(outcome, set), verdict))
for (r in rownames(vt)) say("  %-22s %s", r, paste(sprintf("%s %d", colnames(vt), vt[r, ])[vt[r, ] > 0], collapse = ", "))

# ---- 2. Analysis 2: re-extracted values -------------------------------------------------------
only_el <- c("Lee 2023", "Inoue 2016", "Seong 2024", "Sugihara 2015", "Vleminckx 2024", "Kim 2018",
             "Koizumi 2018", "Kim 2022", "Choi 2014", "Ahi 2024")
only_ro <- c("Inoue 2016", "Sugihara 2015", "Lee 2023", "Seong 2024", "Koizumi 2018", "Demir-Dora 2024")
only_hy <- c("Inoue 2016", "Demir-Dora 2024", "Lee 2023", "Lee 2025", "Zague 2025", "Proksch 2025", "Morakul 2024",
             "Tak 2021", "Evans 2021", "Vleminckx 2024", "Kim 2018", "Choi 2014", "Koizumi 2018")
run <- function(which, label) {
  x <- basis(rx, which)
  el_b  <- x[x$outcome == "elasticity" & !grepl("^S2A|omitted", x$batool_label), ]   # Batool's 19 rows
  el_rm <- x[x$outcome == "elasticity" & grepl("^S2A", x$batool_label), ]             # Yoon, Zmitek
  el_sg <- x[x$outcome == "elasticity" & grepl("omitted", x$batool_label), ]          # Seong week 12
  ro    <- x[x$outcome == "roughness", ]
  stopifnot(nrow(el_b) == 19, nrow(el_rm) == 2, nrow(el_sg) == 1, nrow(ro) == 22)
  el_all <- rbind(el_b, el_rm, el_sg)
  hy_b  <- x[x$outcome == "hydration" & !grepl("^S1A", x$batool_label), ]             # Batool's 31 rows
  hy_rm <- x[x$outcome == "hydration" & grepl("^S1A", x$batool_label), ]              # Morakul, Koizumi
  stopifnot(nrow(hy_b) == 31, nrow(hy_rm) == 2)
  hy_all <- rbind(hy_b, hy_rm)
  say("")
  say("== %s ==", label)
  say("ANALYSIS 2. Hydration (positive favours collagen)")
  show("Batool's 31 rows, re-extracted", hy_b)
  show("plus the two removed rows (Morakul 2024, Koizumi 2017)", hy_all)
  showml("multilevel, all of the above", hy_all)
  show("excluding Baek 2025 (hibiscus extract) and Evans 2021 (self-rated)", hy_all[!hy_all$trial %in% c("Baek 2025", "Evans 2021"), ])
  if (which == "endpoint") {
    show("endpoint values only (change-only rows Yoon x2, Koizumi dropped)", hy_all[!is.na(hy_all$endpoint_g), ])
    yci <- hy_all; k <- yci$trial == "Yoon 2014"                       # unlabelled bars read as 95% CIs, not SEMs
    e <- escalc("SMD", m1i = m1, sd1i = sd1 / qnorm(0.975), n1i = n1, m2i = m2, sd2i = sd2 / qnorm(0.975), n2i = n2, data = yci[k, ])
    yci$smd[k] <- e$yi; yci$vi[k] <- e$vi
    say("    (Yoon rows read as 95%% CIs: %s)", paste(sprintf("%.2f", e$yi), collapse = ", "))
    show("Yoon 2014 error bars read as 95% CIs instead of SEMs", yci)
  }
  say("ANALYSIS 2. Elasticity (positive favours collagen)")
  show("Batool's 19 rows, re-extracted", el_b)
  show("plus the two removed rows (Yoon 2014, Zmitek 2020)", rbind(el_b, el_rm))
  show("plus Seong 2024 week 12 (omitted by Batool)", el_all)
  showml("multilevel, all of the above", el_all)
  if (which == "endpoint") show("endpoint values only (change-only rows Lee, Koizumi, Yoon dropped)",
                                el_all[!is.na(el_all$endpoint_g), ])
  say("ANALYSIS 2. Roughness (negative favours collagen)")
  show("Batool's 22 rows, re-extracted", ro)
  showml("multilevel", ro)
  show("excluding Demir-Dora 2024 (sign question)", ro[ro$trial != "Demir-Dora 2024", ])
  if (which == "endpoint") show("endpoint values only (change-only rows Lee, Koizumi dropped)",
                                ro[!is.na(ro$endpoint_g), ])
  say("ANALYSIS 4 (separate question): collagen-only products")
  stopifnot(all(only_el %in% el_all$trial), all(only_ro %in% ro$trial))
  h4 <- hy_all[hy_all$trial %in% only_hy, ]
  show("hydration, collagen-only", h4)
  showml("hydration, collagen-only, multilevel", h4)
  if (which == "endpoint") show("hydration, collagen-only, endpoint values only", h4[!is.na(h4$endpoint_g), ])
  e4 <- el_all[el_all$trial %in% only_el, ]
  r4 <- ro[ro$trial %in% only_ro, ]
  show("elasticity, collagen-only", e4)
  showml("elasticity, collagen-only, multilevel", e4)
  show("elasticity, collagen-only, placebo-controlled (excluding Choi)", e4[e4$trial != "Choi 2014", ])
  if (which == "endpoint") show("elasticity, collagen-only, endpoint values only", e4[!is.na(e4$endpoint_g), ])
  show("roughness, collagen-only (negative favours collagen)", r4)
  showml("roughness, collagen-only, multilevel", r4)
  if (which == "endpoint") show("roughness, collagen-only, endpoint values only", r4[!is.na(r4$endpoint_g), ])
}
say("")
say("Batool as printed, for comparison:")
show("hydration (Figure 4), recomputed", transform(fv[fv$outcome == "hydration", ], cohort = trial))
show("elasticity (Figure 5), recomputed", transform(fv[fv$outcome == "elasticity", ], cohort = trial))
show("roughness (Figure 8), recomputed", transform(fv[fv$outcome == "roughness", ], cohort = trial))
say("")
say("Analysis 4 keeps trials where collagen was the only active ingredient that differed between arms,")
say("per the trial report. Excluded as multi-ingredient: Nomoto, Ito, Bolke, Schwartz, Yoon (astaxanthin),")
say("Zmitek (CoQ10 and vitamins), Lin (Djulis extract). Excluded from hydration: Baek 2025 (hibiscus")
say("'collagen alternative' with no collagen in its ingredient list; composition unclear).")
run("endpoint", "PRIMARY: endpoint SMD where reported (change-score SMD only where a trial reports nothing else)")
run("change",   "SENSITIVITY: change-score SMD wherever reported, endpoint otherwise")
run("best",     "SENSITIVITY: row-by-row choice in re-extraction.csv (best_g)")

say("")
say("== Session ==")
say("  %s; metafor %s", R.version.string, packageVersion("metafor"))
close(out)
