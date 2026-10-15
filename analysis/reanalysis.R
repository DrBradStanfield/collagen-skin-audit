# Re-analysis of Grimes & Mahto (2026) Data S1 with verified data-entry corrections.
#
# Run from the repository root:   Rscript analysis/reanalysis.R
# Needs R packages metafor and readxl. Writes analysis/results.txt and data/corrected/*.csv.
#
# Steps
#   1. Check the Data S1 files are the published ones (MD5) and read them unmodified.
#   2. Check that every "published_*" value in corrections/corrections.csv matches Data S1.
#   3. Reproduce all ten rows of Grimes & Mahto's Table 2 from the published data; stop if not.
#   4. Apply the corrections and write the corrected datasets.
#   5. Pool published vs corrected data; decomposition; sensitivity analyses; dose meta-regressions.
#
# Effect size: standardised mean difference (Hedges' g, metafor escalc "SMD"), collagen minus
# control, so a positive value favours collagen. Random-effects model, REML (metafor default),
# the same settings as Grimes & Mahto's own code (data/grimes-mahto-2026-data-s1/*_regs_complete.R).
# Prediction intervals are metafor's default (normal-based); t-based intervals are given with the
# Hartung-Knapp sensitivity analyses.

suppressMessages({ library(metafor); library(readxl) })
options(width = 120)

s1 <- "data/grimes-mahto-2026-data-s1"
if (!file.exists(file.path(s1, "allelasticfinal.xlsx")))
  stop("Run this script from the repository root (the folder that contains data/ and analysis/).")

# ---- 1. inputs are the published files ------------------------------------------------------------
md5 <- c("allelasticfinal.xlsx" = "c15a061f00cf072cba21057e007a2afc",
         "hydrodata.xlsx"       = "e341794f5751d5de35af1af215c11699")
got <- tools::md5sum(file.path(s1, names(md5)))
if (any(got != md5)) stop("Data S1 files differ from the published versions (MD5 mismatch).")

elas <- as.data.frame(suppressMessages(read_excel(file.path(s1, "allelasticfinal.xlsx"))))[, 1:17]
hyd  <- as.data.frame(suppressMessages(read_excel(file.path(s1, "hydrodata.xlsx"))))[, 1:16]
elas <- elas[!is.na(elas$study), ]
hyd  <- hyd[!is.na(hyd$study), ]
corr <- read.csv("corrections/corrections.csv", stringsAsFactors = FALSE, check.names = FALSE)

out <- file("analysis/results.txt", open = "wt")
say <- function(...) { txt <- sprintf(...); cat(txt, "\n", sep = ""); cat(txt, "\n", sep = "", file = out) }
say("Data S1 MD5 checked: %s", paste(names(md5), collapse = ", "))

cols <- c("NE", "ME", "SE", "NC", "MC", "SC", "dose", "Time")
row_of <- function(d, study) {
  i <- which(d$study == study)
  if (length(i) != 1) stop("expected exactly one row for '", study, "', found ", length(i))
  i
}

# ---- 2. corrections table must describe Data S1 exactly -----------------------------------------
say("")
say("== Step 2: corrections table vs Data S1 as published ==")
mismatch <- 0
for (k in seq_len(nrow(corr))) {
  d <- if (corr$file[k] == "elasticity") elas else hyd
  i <- row_of(d, corr$study_in_DataS1[k])
  for (cl in cols) {
    pub <- corr[[paste0("published_", cl)]][k]
    new <- corr[[paste0("corrected_", cl)]][k]
    if (!is.na(new) && is.na(pub)) stop("corrections.csv ", corr$id[k], " changes ", cl, " without recording the published value")
    if (is.na(pub)) next
    if (abs(as.numeric(d[i, cl]) - pub) > 1e-5 * max(1, abs(pub))) {
      mismatch <- mismatch + 1
      say("  MISMATCH %s %s %s: Data S1 %s vs table %s", corr$id[k], corr$study_in_DataS1[k], cl, d[i, cl], pub)
    }
  }
}
if (mismatch > 0) stop(mismatch, " published values in corrections.csv do not match Data S1")
say("  All %d rows: every changed cell's published value matches Data S1.", nrow(corr))

# ---- helpers ------------------------------------------------------------------------------------
es <- function(d) escalc("SMD", m1i = ME, sd1i = SE, n1i = NE, m2i = MC, sd2i = SC, n2i = NC, data = d)
fit <- function(d, subset = rep(TRUE, nrow(d)), ...) rma(yi, vi, data = es(d)[subset, ], ...)
pool <- function(lab, d, subset = rep(TRUE, nrow(d)), ...) {
  m <- fit(d, subset, ...)
  p <- predict(m)
  pr <- if (m$k > 3) predict(m, pi.type = "Riley") else p
  say("  %-66s g = %5.2f (95%% CI %5.2f to %5.2f), p = %.2g, k = %2d, I2 = %2.0f%%, 95%% PI %5.2f to %5.2f (t-based %5.2f to %5.2f)",
      lab, m$b[1], m$ci.lb, m$ci.ub, m$pval[1], m$k, m$I2, p$pi.lb, p$pi.ub, pr$pi.lb, pr$pi.ub)
  invisible(m)
}
dose_fit <- function(d, subset = rep(TRUE, nrow(d)), cumulative = FALSE) {
  e <- es(d)[subset, ]
  e$cum <- e$dose * e$Time * 7
  if (cumulative) rma(yi, vi, mods = ~ cum, data = e) else rma(yi, vi, mods = ~ dose, data = e)
}
slope <- function(lab, d, subset = rep(TRUE, nrow(d)), cumulative = FALSE) {
  m <- dose_fit(d, subset, cumulative)
  say("  %-66s %s coefficient = %7.4f (95%% CI %7.4f to %7.4f), p = %.3f, k = %2d",
      lab, if (cumulative) "cumulative-dose (g)" else "daily-dose (g/day)",
      m$b[2], m$ci.lb[2], m$ci.ub[2], m$pval[2], m$k)
  invisible(m)
}
deM <- function(d) d$ma1 == 1   # de Miranda 2021 subset (Data S1 column ma1); all rows = Pu 2023 set
swap_rows <- function(d, studies, src) { for (s in studies) d[row_of(d, s), cols] <- src[row_of(src, s), cols]; d }

# ---- 3. reproduce Grimes & Mahto Table 2 from the published data -------------------------------
say("")
say("== Step 3: reproduce all ten rows of Grimes & Mahto Table 2 (daily-dose meta-regression, published data) ==")
t2 <- data.frame(
  set     = c("deM", "deM", "deM", "deM", "deM", "Pu", "Pu", "Pu", "Pu", "Pu"),
  outcome = c("hyd", "hyd", "ela", "ela", "ela", "hyd", "hyd", "ela", "ela", "ela"),
  subset  = c("all", "capacitance", "all", "pressure", "suction", "all", "capacitance", "all", "pressure", "suction"),
  b  = c(0.03, 0.03, -0.10, -4.89, -0.09, 0.07, 0.07, 0.02, -4.89, 0.04),
  lb = c(-0.10, -0.10, -0.67, -21.53, -0.30, -0.01, -0.01, -0.35, -21.53, -0.14),
  ub = c(0.15, 0.15, 0.46, 11.79, 0.12, 0.14, 0.15, 0.39, 11.79, 0.22),
  p  = c(0.66, 0.69, 0.72, 0.57, 0.41, 0.08, 0.08, 0.92, 0.57, 0.70),
  k  = c(9, 8, 13, 3, 10, 16, 14, 18, 3, 14),
  I2 = c(74.5, 77.3, 99.0, 99.5, 92.6, 58.8, 63.4, 98.6, 99.5, 94.1))
# Two printed values do not round from the model output; both are documented in the README:
# the pressure-methods coefficient (printed -4.89; model -4.87 with an identical CI) and the
# Pu suction lower limit (printed -0.14; model -0.148, apparently truncated).
# Exempt cells are checked against the documented model value instead of the printed one.
known <- list(list(4, "b", -4.868), list(9, "b", -4.868), list(10, "lb", -0.148))
fails <- 0
for (r in seq_len(nrow(t2))) {
  d  <- if (t2$outcome[r] == "hyd") hyd else elas
  ss <- if (t2$set[r] == "deM") deM(d) else rep(TRUE, nrow(d))
  if (t2$subset[r] == "capacitance") ss <- ss & d$cap_method %in% 1
  if (t2$subset[r] == "pressure")    ss <- ss & d$Pressure %in% 1
  if (t2$subset[r] == "suction")     ss <- ss & d$Suction %in% 1
  m <- dose_fit(d, ss)
  got <- c(b = m$b[2], lb = m$ci.lb[2], ub = m$ci.ub[2], p = m$pval[2])
  ok <- TRUE
  for (nm in c("b", "lb", "ub", "p")) {
    ex <- Filter(function(x) x[[1]] == r && x[[2]] == nm, known)
    target <- if (length(ex)) ex[[1]][[3]] else t2[[nm]][r]
    if (abs(got[[nm]] - target) > 0.006) ok <- FALSE
  }
  if (m$k != t2$k[r] || abs(m$I2 - t2$I2[r]) > 0.11) ok <- FALSE
  if (!ok) fails <- fails + 1
  say("  %-3s %-3s %-11s ours %6.2f (%6.2f, %6.2f) p %.2f k %2d I2 %4.1f%% | printed %6.2f (%6.2f, %6.2f) p %.2f k %2d I2 %4.1f%% %s",
      t2$set[r], t2$outcome[r], t2$subset[r], got[["b"]], got[["lb"]], got[["ub"]], got[["p"]], m$k, m$I2,
      t2$b[r], t2$lb[r], t2$ub[r], t2$p[r], t2$k[r], t2$I2[r],
      if (!ok) "MISMATCH" else if (r %in% c(4, 9, 10)) "match (documented exception)" else "match")
}
if (fails > 0) stop(fails, " rows of Table 2 were not reproduced")
say("  All ten rows reproduced (see the comment above for the two printed values that do not round from the model).")

# ---- 4. apply corrections -----------------------------------------------------------------------
apply_corr <- function(d, which) {
  for (k in which(corr$file == which)) {
    i <- row_of(d, corr$study_in_DataS1[k])
    for (cl in cols) {
      v <- corr[[paste0("corrected_", cl)]][k]
      if (!is.na(v)) d[i, cl] <- v
    }
  }
  d
}
elas_c <- apply_corr(elas, "elasticity")
hyd_c  <- apply_corr(hyd, "hydration")
dir.create("data/corrected", showWarnings = FALSE, recursive = TRUE)
write.csv(elas_c, "data/corrected/elasticity-corrected.csv", row.names = FALSE)
write.csv(hyd_c,  "data/corrected/hydration-corrected.csv",  row.names = FALSE)
write.csv(elas,   "data/corrected/elasticity-as-published.csv", row.names = FALSE)
write.csv(hyd,    "data/corrected/hydration-as-published.csv",  row.names = FALSE)

# ---- 5. results ---------------------------------------------------------------------------------
say("")
say("== Step 5a: pooled effect, Data S1 as published vs corrected (all rows) ==")
say("  Grimes & Mahto report dose meta-regressions, not pooled effects. 'As published' below is MY")
say("  pooling of their dataset with their model settings, without the dose term.")
say("Elasticity")
pool("my pooling of Data S1 as published", elas)
pool("corrected", elas_c)
say("Hydration")
pool("my pooling of Data S1 as published", hyd)
pool("corrected", hyd_c)

say("")
say("== Step 5b: elasticity decomposition (which corrections move the result) ==")
pool("as published, only the Czajka error corrected", swap_rows(elas, "czaka 2018", elas_c))
pool("as published, Czajka excluded", elas, elas$study != "czaka 2018")
rev7 <- c("Ito 2018", "Nometo 2020", "Inno 2016", "sangsuwan 2020", "choi 2014", "genovase 2017", "koizuma 2018")
pool("as published, the 7 reversed rows replaced by their corrected rows", swap_rows(elas, rev7, elas_c))
pool("corrected, Czajka excluded", elas_c, elas_c$study != "czaka 2018")
pool("corrected, but Campos as entered in Data S1 (error bars read as SDs)", swap_rows(elas_c, "campos", elas))

say("")
say("== Step 5c: elasticity sensitivity analyses (corrected data) ==")
sang4 <- elas_c; i <- row_of(sang4, "sangsuwan 2020"); sang4[i, c("ME", "SE", "MC", "SC")] <- c(0.57, 0.11, 0.47, 0.08)
pool("Sangsuwan at week 4 (end of dosing) instead of week 8", sang4)
pool("Cutometer R2 rows only (one device, one parameter)", elas_c, elas_c$Notes %in% "R2")
pool("Cutometer R2 only, excluding untreated controls (Choi, Nomoto)", elas_c,
     elas_c$Notes %in% "R2" & !elas_c$study %in% c("choi 2014", "Nometo 2020"))
pool("suction (Cutometer) rows only", elas_c, elas_c$Suction %in% 1)
pool("excluding untreated, non-placebo controls (Choi, Nomoto)", elas_c, !elas_c$study %in% c("choi 2014", "Nometo 2020"))
checked_e <- setdiff(elas_c$study, "tak 2021")   # every row checked against its paper; Tak's direction is unclear
pool("excluding Tak 2021 (the only row whose direction could not be confirmed)", elas_c, elas_c$study %in% checked_e)
takflip <- elas_c; i <- row_of(takflip, "tak 2021"); takflip[i, c("ME", "MC")] <- takflip[i, c("MC", "ME")]
pool("Tak 2021 elasticity sign reversed (if its mm measure is lower-is-better)", takflip)
cz <- elas_c; i <- row_of(cz, "czaka 2018"); cz[i, "MC"] <- 7.0 + (7.9 - 6.9)
pool("Czajka with the baseline difference removed (control + 1.0)", cz)
kz <- elas_c; i <- row_of(kz, "koizuma 2018"); kz[i, c("SE", "SC")] <- c(0.007 * sqrt(37), 0.008 * sqrt(34))
pool("Koizumi SDs from baseline SEM x sqrt(n) instead of delta method", kz)
pool("excluding Campos (error-bar type inferred; 95% CI reading used)", elas_c, elas_c$study != "campos")
cs <- swap_rows(elas_c, "campos", elas)
pool("Campos error bars read as SDs (as entered in Data S1 and Pu 2023)", cs)
cm <- elas_c; i <- row_of(cm, "campos"); cm[i, c("SE", "SC")] <- c(0.04, 0.026) * sqrt(30)
pool("Campos error bars read as SEMs", cm)
pool("excluding di Cerbo (post-washout reading; device units unstated)", elas_c, elas_c$study != "di cerbo 2014")
pool("excluding Sugihara 2015 (shares its placebo group with Inoue 2016)", elas_c, elas_c$study != "shugihara2015")
pool("de Miranda subset only", elas_c, deM(elas_c))
pool("Grimes & Mahto 'Not Industry' label (includes manufacturer-supplied trials)", elas_c,
     trimws(tolower(elas_c$sponsor)) == "not industry")
m <- pool("Hartung-Knapp (t-based CI and PI)", elas_c, test = "knha")
m <- pool("Cutometer R2 only, Hartung-Knapp", elas_c, elas_c$Notes %in% "R2", test = "knha")
loo <- leave1out(fit(elas_c))
say("  leave-one-out: estimates %.2f to %.2f (lowest without %s); largest p = %.2g",
    min(loo$estimate), max(loo$estimate), elas_c$study[which.min(loo$estimate)], max(loo$pval))
r <- regtest(fit(elas_c)); say("  Egger-type regression test for funnel asymmetry: z = %.2f, p = %.2f", r$zval, r$pval)

say("")
say("== Step 5d: hydration sensitivity analyses (corrected data) ==")
checked_h <- setdiff(hyd_c$study, "yoon 2014")   # every row checked; Yoon's week-12 SDs are not reported
pool("excluding Yoon 2014 (endpoint SDs not reported; values rebuilt from a figure)", hyd_c, hyd_c$study %in% checked_h)
pool("excluding di Cerbo (post-washout reading; device units unstated)", hyd_c, hyd_c$study != "di cerbo 2015")
pool("excluding Sugihara 2015 (shares its placebo group with Inoue 2016)", hyd_c, hyd_c$study != "shugihara2015")
mi <- hyd_c; i <- row_of(mi, "miyanga 2021"); mi[i, c("ME", "SE", "MC", "SC")] <- c(16.34, 10.97, 6.53, 7.50)
pool("Miyanaga as its reported change score (5 g SD 10.97) instead of an endpoint", mi)
mi[i, "SE"] <- 9.49
pool("Miyanaga as change score with the other error-bar cap (5 g SD 9.49)", mi)
pool("excluding Miyanaga hydration (week-12 SDs not reported)", hyd_c, hyd_c$study != "miyanga 2021")
as2 <- hyd_c; i <- row_of(as2, "Asserin 2015"); as2[i, c("NE", "ME", "SE")] <- c(11, 64.72, 2.54 * sqrt(11))
pool("Asserin, Peptan P arm only (the arm Data S1 used), corrected SDs", as2)
pool("excluding untreated, non-placebo controls (Choi, Nomoto)", hyd_c, !hyd_c$study %in% c("choi 2014", "Nometo 2020"))
pool("capacitance devices only", hyd_c, hyd_c$cap_method %in% 1)
pool("de Miranda subset only", hyd_c, deM(hyd_c))
pool("Grimes & Mahto 'Not Industry' label (includes manufacturer-supplied trials)", hyd_c,
     trimws(tolower(hyd_c$sponsor)) == "not industry")
m <- pool("Hartung-Knapp (t-based CI and PI)", hyd_c, test = "knha")
loo <- leave1out(fit(hyd_c))
say("  leave-one-out: estimates %.2f to %.2f (lowest without %s); largest p = %.2g",
    min(loo$estimate), max(loo$estimate), hyd_c$study[which.min(loo$estimate)], max(loo$pval))
r <- regtest(fit(hyd_c)); say("  Egger-type regression test for funnel asymmetry: z = %.2f, p = %.2f", r$zval, r$pval)

say("")
say("== Step 5e: ANALYSIS 3 (separate question): collagen-only products, corrected data ==")
say("  Trials where collagen was the only active ingredient that differed between arms, per the trial")
say("  report (Kim 2018 gave 100 mg vitamin C to both arms; Jung's drink vehicle contains vitamin C).")
say("  Excluded as multi-ingredient: Ito, Nomoto, Genovese, Czajka, Yoon, Zmitek, Campos, Bolke,")
say("  Schwartz, di Cerbo (VISCODERM Pearls). Asserin (Peptan P vs placebo) is collagen only.")
only_e <- c("Inno 2016", "sangsuwan 2020", "choi 2014", "koizuma 2018", "kim 2018", "miyanaga 2021",
            "shugihara2015", "tak 2021")
only_h <- c("Inoue 2016", "koizuma 2018", "shugihara2015", "choi 2014", "kim 2018", "tak 2021", "jung 2020",
            "miyanga 2021", "Asserin 2015")
if (!all(only_e %in% elas_c$study) || !all(only_h %in% hyd_c$study)) stop("collagen-only study names not found")
pool("elasticity, collagen-only products", elas_c, elas_c$study %in% only_e)
pool("elasticity, collagen-only, placebo-controlled (excluding Choi)", elas_c, elas_c$study %in% setdiff(only_e, "choi 2014"))
pool("elasticity, collagen-only, Cutometer R2 only", elas_c, elas_c$study %in% only_e & elas_c$Notes %in% "R2")
pool("hydration, collagen-only products", hyd_c, hyd_c$study %in% only_h)
pool("hydration, collagen-only, placebo-controlled (excluding Choi)", hyd_c, hyd_c$study %in% setdiff(only_h, "choi 2014"))
pool("hydration, collagen-only, excluding Jung (placebo contents not itemised)", hyd_c, hyd_c$study %in% setdiff(only_h, "jung 2020"))
pool("elasticity, collagen-only, excluding Tak 2021 (direction unclear)", elas_c, elas_c$study %in% setdiff(only_e, "tak 2021"))
pool("elasticity, collagen-only, excluding Sugihara (shares Inoue's placebo group)", elas_c, elas_c$study %in% setdiff(only_e, "shugihara2015"))
pool("hydration, collagen-only, excluding Sugihara (shares Inoue's placebo group)", hyd_c, hyd_c$study %in% setdiff(only_h, "shugihara2015"))
pool("elasticity, collagen-only, excluding Kim 2018 (vitamin C in both arms)", elas_c, elas_c$study %in% setdiff(only_e, "kim 2018"))

say("")
say("== Step 5f: dose meta-regressions, published vs corrected ==")
for (set in c("Pu set (all rows)", "de Miranda subset")) {
  say(set)
  se <- if (set == "de Miranda subset") deM(elas) else rep(TRUE, nrow(elas))
  sh <- if (set == "de Miranda subset") deM(hyd)  else rep(TRUE, nrow(hyd))
  slope("elasticity, published", elas, se);   slope("elasticity, corrected", elas_c, se)
  slope("hydration, published", hyd, sh);     slope("hydration, corrected", hyd_c, sh)
  slope("elasticity, published", elas, se, TRUE); slope("elasticity, corrected", elas_c, se, TRUE)
  slope("hydration, published", hyd, sh, TRUE);   slope("hydration, corrected", hyd_c, sh, TRUE)
}
say("Pu suction-methods subset (Table 2 row), corrected:")
sc <- elas_c$Suction %in% 1
slope("elasticity, suction, published", elas, elas$Suction %in% 1); slope("elasticity, suction, corrected", elas_c, sc)
slope("elasticity, suction, published", elas, elas$Suction %in% 1, TRUE); slope("elasticity, suction, corrected", elas_c, sc, TRUE)
say("Sensitivity: corrected data but Campos as entered (error bars read as SDs; dose unchanged):")
slope("elasticity, all rows", cs); slope("elasticity, all rows", cs, cumulative = TRUE)
slope("elasticity, suction", cs, cs$Suction %in% 1); slope("elasticity, suction", cs, cs$Suction %in% 1, TRUE)

say("")
say("== Session ==")
say("  %s; metafor %s; readxl %s", R.version.string, packageVersion("metafor"), packageVersion("readxl"))
close(out)
