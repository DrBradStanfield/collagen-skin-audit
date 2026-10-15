# Collagen and skin: re-analysis of two 2026 meta-analyses

This repository contains four analyses of oral collagen and skin elasticity, hydration and roughness:

1. Grimes & Mahto 2026. I checked the dataset (Data S1) behind Grimes DR, Mahto A. *Hydrolyzed collagen for skin aging meta-analyses are unreliable.* J Cosmet Dermatol 2026;25(10):e71208, [doi:10.1111/jocd.71208](https://doi.org/10.1111/jocd.71208), against the original trial reports, corrected the verified errors and re-pooled the data.
2. Batool et al. 2026. I re-analysed Batool A, et al. *Oral collagen peptides and skin rejuvenation.* J Cosmet Dermatol 2026;25(7):e71041, [doi:10.1111/jocd.71041](https://doi.org/10.1111/jocd.71041), re-extracting every hydration, elasticity and roughness row from the original trial reports.
3. Collagen-only products, Grimes & Mahto data. This asks a separate question: what happens when only trials of collagen on its own are pooled? Both meta-analyses mix in multi-ingredient products.
4. Collagen-only products, Batool data. The same question, asked of the re-extracted Batool data.

Everything can be checked. Each correction cites the table and page in the original paper. Both scripts first reproduce the authors' own published results, and stop if they can't.

Author: Brad Stanfield, MBChB, FRNZCGP (general practitioner, New Zealand). Corrections are welcome: open an issue or email brad@drstanfield.com.

## Conflict of interest

I own a company that sells a dietary supplement containing hydrolysed collagen peptides. I also make health videos on YouTube, which earn revenue, including one that discusses these papers. The corrected results favour the kind of product I sell. No one funded this work. This audit was not registered in advance, and I did not decide beforehand which rows to check (see "How rows were checked" below).

I used AI tools (Anthropic's Claude and OpenAI's Codex) to help extract values from the trial reports, cross-check them and run the analyses. Separate AI review runs, not involved in the extraction, were asked to try to refute every re-extracted row and every correction. I checked the results and take responsibility for them. As a final check, a separate run was given only the trial papers for the 26 trials behind the corrections and extracted every value blind; comparing it with this repository matched 546 values, and none of the mismatches changed a result ([`checks/`](checks/)). The corrections added on 16 October 2026 got the same blind check separately (see "How rows were checked"). Please weigh the work with the conflict in mind; that is why every number is traceable to a published source.

#### Terms used below
- SMD (standardised mean difference): the difference between groups in standard-deviation units, computed here as Hedges' g. As a rough guide, 0.2 is small, 0.5 moderate and 0.8 large.
- REML: restricted maximum likelihood, the usual way of fitting a random-effects model.
- Cutometer R2 ("gross elasticity"): how far the skin springs back after suction; higher is better.
- Cutometer R5 ("net elasticity", Ur/Ue): the immediate recovery as a share of the elastic stretch; higher is better.

---

## Analysis 1: Grimes & Mahto (2026) Data S1

### What I found

Grimes and Mahto found real problems in two earlier meta-analyses, de Miranda 2021 and Pu 2023: standard errors (SEM) used as standard deviations (SD), incompatible measures pooled together, and wrong sample sizes. They also published their data and code, which is what made this check possible.

Their dataset has errors too. Every one is listed in [`corrections/corrections.csv`](corrections/corrections.csv) with its source table and page. I have now checked every row of Data S1 against its paper.

- Arms reversed in eight trials. In seven, the collagen and control values are the wrong way round: Ito 2018, Nomoto 2020, Sangsuwan 2021, Choi 2014, Genovese 2017 and Koizumi 2018 (elasticity), and Tak 2021 (hydration). In the eighth, Inoue 2016 (elasticity), the placebo mean is in the collagen column and the high-dose collagen mean is in the control column.
- Kim 2018: a wrinkle-roughness score is entered as elasticity.
- Yoon 2014: absolute changes in R2 are treated as proportional changes, and the dose per tablet is entered as the dose per day.
- Miyanaga 2021 (hydration): absolute changes in skin capacitance are treated as percentage changes.
- Czajka 2018: SEMs are entered as SDs, the collagen arm's baseline is entered as the control's endpoint, and the collagen n is 69 instead of 61.
- Campos 2015 (elasticity): the paper shows R5 only as a bar chart with unlabelled error bars, and Data S1 reads the bars as SDs, as Pu 2023 did. I think they are more likely 95% confidence intervals or SEMs (see below).
- Asserin 2015 and di Cerbo 2015: the SDs entered don't match the SEM bars drawn in the papers' figures. Asserin's are too small, and only the stronger of its two collagen arms is used; di Cerbo's hydration SDs are about three times too large. di Cerbo's means are also misread slightly, and its 4-week dosing period is entered as 2 weeks.
- Jung 2021: the placebo's baseline is entered as its endpoint, and the collagen SD is the baseline SD plus the change SD.
- Inoue 2016 (hydration): one collagen arm's mean is given the sample size of both arms.
- Sample sizes: wrong for Ito 2018 and Kim 2018 hydration; swapped between arms for Sugihara 2015; one too many in Schwartz 2019's control.
- Dose: Schwartz 2019's dose per capsule is entered as the dose per day. Dose errors affect only the dose meta-regressions.

#### The errors don't all run one way
- Seven of the eight reversals, the Kim elasticity row, the Yoon means and the Miyanaga and di Cerbo hydration rows make collagen look worse.
- The Tak reversal, Czajka, Campos, Asserin, Jung, the di Cerbo elasticity row, the Inoue hydration mean and the Kim hydration sample sizes make it look better.
- Czajka is the largest single distortion in the dataset (Hedges' g about 9.4 as entered).

#### The Campos error bars

Campos's R5 values exist only as bars in Figure 1, and the paper doesn't say what the error bars are. Data S1 reads them as SDs, which gives g = 2.17, the largest positive elasticity row once Czajka is corrected. This is an inference either way:
- As SDs, the baseline bars (about 0.017 on means of 0.31 to 0.34) would be several times tighter than R5 SDs in other collagen trials (Schwartz 2019: 0.06 to 0.15; Seong 2024: about 0.08 to 0.10), and the maltodextrin placebo arm would have improved by about 7 baseline SDs in 90 days.
- As SEMs (g = 0.40), the spread is plausible, but the day-90 difference between groups would be significant only if the paper tested change scores, and it says R5 rose significantly compared with placebo.
- As 95% confidence intervals (g = 0.81), both the spread and the significance claim fit. I use this reading; the SD and SEM readings are sensitivity analyses below.

#### Shared placebo group

Sugihara 2015 and Inoue 2016 report the same placebo group, with identical values, the same hospital and the same dates. Data S1 includes both trials, so those 26 controls count twice in each outcome. Excluding Sugihara is run as a sensitivity analysis.

#### The reversals were not carried over from the earlier meta-analyses
- Pu 2023 has all 8 trials the right way round.
- de Miranda 2021 includes 7 of them and has 6 the right way round. It enters Koizumi twice: once with the arms reversed, and once the right way round under the name "Proksch 2014". Both entries use SEMs as SDs.
- See [`corrections/earlier-meta-analyses.csv`](corrections/earlier-meta-analyses.csv).
- Grimes and Mahto's Koizumi values are their own week-12 calculation from the published table, and those are reversed too.

### Results

Grimes and Mahto report dose meta-regressions, not pooled effects. The "as published" column below is my pooling of their dataset with their model settings (random effects, REML, Hedges' g), without the dose term. A positive SMD favours collagen.

| Outcome | My pooling of Data S1 as published | Corrected |
|---|---|---|
| Elasticity (k = 18) | 0.37 (95% CI −0.74 to 1.48), p = 0.51 | 0.55 (0.32 to 0.78), p < 0.001 |
| Elasticity, Cutometer R2 only (k = 10) | | 0.61 (0.37 to 0.84) |
| Hydration (k = 16) | 0.52 (0.28 to 0.76) | 0.56 (0.28 to 0.83) |

The trials vary a lot. For the corrected data, the 95% prediction intervals include zero: elasticity −0.28 to 1.38 and hydration −0.40 to 1.51 (normal-based; the t-based intervals in `results.txt` are slightly wider).

An earlier version of this repository reported corrected elasticity as 0.63 (0.34 to 0.92) and hydration as 0.48 (0.22 to 0.74). That version left Campos, di Cerbo, Asserin, Miyanaga, Schwartz and Sugihara unchecked. Checking them moved elasticity down (mainly Campos) and hydration up (mainly Miyanaga and di Cerbo, partly offset by Asserin).

#### Which corrections drive the elasticity result

The published 0.37 is inflated by one error in collagen's favour (Czajka). With only that error fixed, Data S1 gives −0.04 (−0.54 to 0.46). The move to 0.55 comes from the elasticity reversals and the Kim and Yoon fixes, so the elasticity result depends on those corrections. Each one is sourced in `corrections.csv`. Replacing only the seven reversed elasticity rows with their corrected rows gives 1.01 (0.05 to 1.98). That also fixes Koizumi's SDs and Ito's sample size, which come with those rows.

#### Sensitivity analyses, corrected elasticity

Full output is in [`analysis/results.txt`](analysis/results.txt).

| Analysis | k | SMD (95% CI) |
|---|---|---|
| All rows | 18 | 0.55 (0.32 to 0.78) |
| Cutometer R2 only (one device, one parameter) | 10 | 0.61 (0.37 to 0.84) |
| Cutometer R2 only, excluding the untreated controls (Choi, Nomoto) | 8 | 0.52 (0.30 to 0.73) |
| Excluding the untreated controls (Choi, Nomoto) | 16 | 0.48 (0.25 to 0.72) |
| Campos error bars read as SDs, as in Data S1 | 18 | 0.62 (0.33 to 0.91) |
| Campos error bars read as SEMs | 18 | 0.52 (0.30 to 0.75) |
| Excluding Campos | 17 | 0.53 (0.29 to 0.78) |
| Excluding di Cerbo (post-washout reading; device units unstated) | 17 | 0.56 (0.32 to 0.80) |
| Excluding Sugihara (shares Inoue's placebo group) | 17 | 0.55 (0.30 to 0.79) |
| Sangsuwan at week 4 (end of dosing) instead of week 8 | 18 | 0.56 (0.32 to 0.79) |
| Excluding Tak 2021 (its "mm" measure may be lower-is-better) | 17 | 0.61 (0.39 to 0.82) |
| Czajka with its baseline difference removed | 18 | 0.51 (0.31 to 0.71) |
| Hartung-Knapp confidence interval | 18 | 0.55 (0.30 to 0.80) |
| Leave-one-out range | 17 | 0.48 to 0.61 |

The Cutometer R2 rows include Choi, whose paper says only "Cutometer"; the R2 label comes from Data S1.

#### Hydration sensitivity
- Excluding Yoon 2014 (endpoint SDs not reported; rebuilt from a figure): 0.57 (0.28 to 0.87), k = 15.
- Excluding di Cerbo: 0.51 (0.24 to 0.79). Excluding Sugihara: 0.57 (0.28 to 0.87).
- Miyanaga as its reported change score instead of a rebuilt endpoint: 0.53 (0.27 to 0.80), or 0.54 (0.28 to 0.81) with the other error-bar cap. Excluding Miyanaga: 0.50 (0.23 to 0.77).
- Asserin with only the Peptan P arm, as in Data S1 (corrected SDs): 0.58 (0.29 to 0.86).
- Excluding the untreated controls: 0.50 (0.21 to 0.79).
- Leave-one-out range: 0.48 to 0.61.

Miyanaga reports only change from baseline. To keep every row in this analysis an endpoint SMD (the Cochrane Handbook advises against mixing the two kinds), its corrected row is rebuilt as an endpoint: the screening value plus the change, with the screening SDs. That is the same form Data S1 uses for Yoon and Koizumi. The week-12 SDs aren't reported, so the change score and the exclusion are shown above.

#### Small-study asymmetry

An Egger-type test gives p = 0.34 for hydration and p = 0.71 for elasticity.

#### Dose

Grimes and Mahto's headline ("no evidence of benefit") comes from dose meta-regressions: do trials using more collagen show bigger effects?
- After correction, no dose slope is significant: daily dose p = 0.32 (elasticity) and 0.41 (hydration); cumulative dose p = 0.35 and 0.29; the suction-methods subgroup from their Table 2, p = 0.22 (daily) and 0.27 (cumulative).
- With Campos's SDs left as entered, the elasticity slopes become significant or borderline: daily p = 0.054, cumulative p = 0.015, suction subgroup p = 0.036 (daily) and 0.004 (cumulative). They rest on that one row.
- A missing dose slope tests whether more collagen works better, not whether collagen works. With 16 to 18 small trials it has little power.

#### Reproduction check

Before changing anything, the script reproduces all ten rows of Grimes and Mahto's Table 2 from Data S1 (coefficient, 95% CI, p, k and I²). Two printed values don't round from the model output; the script checks those cells against the documented model values instead:
- the pressure-methods coefficient: model −4.87, printed −4.89, with an identical CI;
- the Pu suction lower limit: model −0.148, printed −0.14.

### What this does not show

- It doesn't answer Grimes and Mahto's other arguments. These are pooling different instruments as SMDs, industry funding, risk of unblinding, and the lack of clinically important thresholds. This re-analysis also pools across instruments; the Cutometer R2-only result is the least exposed to that objection.
- It isn't a collagen-specific effect. Nearly every comparison is against a non-protein placebo. Yoon 2014's control contained casein, and two comparisons are against no supplement at all (Choi, Nomoto). Several products combine collagen with other ingredients. Analyses 3 and 4 look at collagen-only products.
- Industry funding. Most trials were funded, supplied or co-authored by collagen manufacturers.
  - Grimes and Mahto's "Not Industry" label is looser than that. It includes Choi 2014 (product supplied by Amorepacific; four of its nine authors work at Amorepacific's research centre), Žmitek 2020 (product supplied by Valens Int.) and the Tak 2021 elasticity row (three authors employed by the manufacturer, Amicogen; the same trial's hydration row is labelled "industry").
  - Using their label, neither pooled result is statistically significant: elasticity 0.41 (−0.15 to 0.97, k = 6) and hydration 0.72 (−0.03 to 1.47, k = 3). These subsets are too small to tell whether industry trials report larger effects.
- Clinical meaning. These are instrument readings. How well they track changes people would notice is uncertain.

### How rows were checked

Every row of Data S1 has now been checked against its paper. I did not decide in advance which rows to check. The rows I checked first were mostly ones where Data S1 showed collagen doing worse than placebo; the last six trials checked (Campos, di Cerbo, Asserin, Miyanaga, Schwartz, Sugihara) had errors in both directions. Several of those values had to be read from figures; the axis calibrations and readings are in the notes column of `corrections.csv`, and a separate blind extraction of the four figure-read trials is in [`checks/`](checks/).

Two rows can't be fully settled from their papers:
- Tak 2021 elasticity: it's unclear whether its "mm" measure is higher-is-better.
- Yoon 2014 hydration: the week-12 SDs aren't reported. Data S1 rebuilds them from a figure (baseline SD plus the error bar); I left that row as entered and ran it as a sensitivity analysis.

---

## Analysis 2: Batool et al. (2026)

Batool and colleagues pooled 35 trials and reported:
- hydration SMD 0.44 (0.15 to 0.73);
- elasticity 0.62 (0.15 to 1.10);
- skin roughness −0.57 (−1.06 to −0.08); for roughness, negative favours collagen.

Their extracted data are available only on request.

#### Step 1: reproducing their results

I transcribed the study-level values printed in their Figures 4, 5 and 8 ([`data/batool-2026/figure-values-hydration.csv`](data/batool-2026/figure-values-hydration.csv), [`data/batool-2026/figure-values.csv`](data/batool-2026/figure-values.csv)). A random-effects model (REML) on those values reproduces their printed overall results and every weekly subtotal.

#### Step 2: re-extracting every row

Batool's supplementary Figures S1I, S2D and S5D print the inputs (n, mean, SD) behind each row. That let me trace each of their 72 hydration, elasticity and roughness values to the cells in the trial paper it came from, then re-extract the value the paper supports. I obtained the full text of every trial Batool includes, including seven not in the earlier meta-analyses. Each row's source page and table, inputs, how Batool's printed value arises, and a one-word verdict are in [`data/batool-2026/re-extraction.csv`](data/batool-2026/re-extraction.csv). The counts below come from that verdict column, and the script prints them. "Minor slip" means the right cells with a sample-size or SD error that moves the value by less than 0.05; anything larger counts as wrong.

#### Hydration: 17 of Batool's 31 rows are wrong, and an 18th probably is

Most use a wrong time point or the wrong arm, and several enter the placebo value in both arms. The 18th is Yoon week 12, below. Two more have sample-size slips that barely change the value, and one (Evans 2021) has the right numbers for the wrong measure. Ten are correct. Examples:
- Inoue 2016 (low-dose arm, week 8) is printed as −2.36. The paper gives 0.23. Batool's "collagen" value is that arm's *elasticity*, not its moisture.
- Morakul 2024, week 8, is printed as −0.81. The paper gives 1.66. Both of Batool's arms are placebo values, from weeks 10 and 8.
- Lin, week 8; Demir-Dora, week 12; Baek and Zague, week 12: placebo or control values entered in both arms, giving 0.00.
- Yoon 2014 week 12 is printed as 1.30. Batool entered the chart's error bars as SDs. The bars are unlabelled and the paper used a rank test, so their type can't be proven, but as SDs they would imply a difference of more than one SD, which is hard to square with the paper's "not significant". Read as SEMs the value is 0.28; read as 95% CIs it is 0.55.

Batool also removed two hydration rows as outliers (supplementary Figure S1A). Both were extraction errors. Morakul was printed as +8.37 but is 0.88 from the paper (collagen at week 8 against placebo at week 4, with SEMs as SDs). Koizumi was printed as +5.19 but is 0.87 (SEMs as SDs).

Baek 2025's product is a hibiscus enzyme extract marketed as a plant-based "collagen alternative". Its ingredient list (supplementary Table S4a) names no collagen, but its amino-acid analysis (Table S4b: glycine 19%, hydroxyproline 9.7%, proline 6.9%) looks like collagen, so what it contains is unclear. Evans 2021's hydration is a self-rated questionnaire, not an instrument reading.

#### Elasticity: 16 of Batool's 19 rows pair the wrong cells

The other three have smaller errors (sample sizes, a chart reading). Examples, each shown as the paper's endpoint value:
- Ahi 2024 is printed as 3.59; the paper gives 0.21. Batool's control value is the placebo's *hydration*.
- Schwartz 2019 is printed as 2.64; the paper gives 0.50. Batool's control value is the collagen arm's own baseline.
- Nomoto week 8 is printed as 0.15; the paper gives 1.20 (0.67 from the paper's adjusted between-group change). Batool's control value is the collagen arm's week-6 value.
- Koizumi is printed as 0.30; the paper gives 0.93 (it reports only change from baseline). Batool's control value is a placebo *moisture* change, with SEMs used as SDs.

The errors run in both directions.

#### The two "extreme negative outliers" were extraction errors

Batool removed two week-12 rows as "extreme negative outliers [29, 39]". Supplementary Figure S2A shows the removed rows are Yoon 2014 (−7.89) and Žmitek 2020 (−6.08), so reference 29 (Seong 2024) is the wrong citation.
- From the papers, Yoon is +0.68 (change from baseline, read partly from a chart) and Žmitek is −0.39. Neither is extreme.
- Batool includes Seong only at weeks 4 and 8. Its week-12 result (+0.61) is missing. So are some other results, such as Sugihara week 4 and later Lee time points; I did not add those.

#### Roughness
- Demir-Dora 2024's three rows have the wrong sign. The paper says higher values mean improvement, but they were plotted as if lower were better.
- Koizumi's two rows use SEMs as SDs: −0.60 and −5.53 are printed, and the paper supports −0.10 and −0.93.
- The remaining rows match the papers, apart from small sample-size slips (Sugihara weeks 4 and 8, Schwartz week 6), a control SD in Sugihara week 8, and an apparent typo in the paper's Schwartz week-6 endpoint.
- The roughness result doesn't depend on Demir-Dora: without its three rows the estimate is −0.54 (−0.77 to −0.30).

#### Which value I used

The primary analysis uses the endpoint SMD wherever a trial reports endpoints. It uses change from baseline only where that is all a trial reports (Koizumi and Yoon for all three outcomes, and Lee 2023 for elasticity and roughness). The Cochrane Handbook advises against mixing the two kinds of SMD, so this keeps nearly every row on the same scale. The sensitivity analyses drop the change-only rows, use change scores wherever reported, and use a row-by-row choice (`best_g`).

Koizumi reports elasticity only as percent change from baseline. In Analysis 1 I keep Grimes and Mahto's form for it, an endpoint rebuilt as baseline × (1 + change), which gives 0.35. Here I use the printed change scores, which give 0.93. Both read the same cells correctly; the gap is the scale, because the rebuilt endpoint's SD carries the spread between people at baseline and the change score's SD doesn't.

`best_g` is a judgement call, made row by row and recorded with its reason in `best_basis`. It usually takes the change score where the arms differed at baseline by about a third of an SD or more and the paper prints change SDs, and the endpoint otherwise. The exceptions are noted in the file and run both ways.

For Lee 2023 elasticity, Batool used the parameter K. The methods define K only as "skin firmness or softness", though the results treat a rise as improvement. I used the coefficient of restitution (CoR). K gives −0.06 and CoR gives 0.05; the pooled result doesn't change.

| Analysis 2 | SMD (95% CI) | Rows, trials | I² |
|---|---|---|---|
| Hydration, Batool's printed values (recomputed) | 0.44 (0.15 to 0.73) | 31, 19 | 91% |
| Hydration, Batool's rows re-extracted | 0.58 (0.38 to 0.78) | 31, 19 | 80% |
| Plus the two removed rows (Morakul, Koizumi) | 0.60 (0.41 to 0.78) | 33, 20 | 79% |
| Same, multilevel model with cluster-robust CI | 0.58 (0.33 to 0.84) | 33, 20 | |
| Excluding Baek (hibiscus "collagen alternative") and Evans (self-rated) | 0.61 (0.42 to 0.81) | 31, 18 | 80% |
| Endpoint values only (change-only rows dropped) | 0.61 (0.41 to 0.81) | 30, 18 | 81% |
| Yoon's error bars read as 95% CIs, not SEMs | 0.61 (0.42 to 0.79) | 33, 20 | 79% |
| Change scores wherever reported | 0.77 (0.58 to 0.97) | 33, 20 | 81% |
| Elasticity, Batool's printed values (recomputed) | 0.62 (0.15 to 1.09) | 19, 14 | 93% |
| Elasticity, Batool's rows re-extracted | 0.47 (0.29 to 0.65) | 19, 14 | 57% |
| Plus the two removed rows (Yoon, Žmitek) and Seong week 12 | 0.46 (0.29 to 0.62) | 22, 16 | 56% |
| Same, multilevel model with cluster-robust CI | 0.46 (0.29 to 0.62) | 22, 16 | |
| Endpoint values only (change-only rows dropped) | 0.45 (0.27 to 0.63) | 19, 13 | 54% |
| Change scores wherever reported | 0.52 (0.37 to 0.68) | 22, 16 | 51% |
| Roughness, Batool's printed values (recomputed) | −0.57 (−1.06 to −0.08) | 22, 9 | 96% |
| Roughness, re-extracted | −0.57 (−0.77 to −0.37) | 22, 9 | 76% |
| Same, multilevel model with cluster-robust CI | −0.60 (−1.07 to −0.13) | 22, 9 | |
| Excluding Demir-Dora | −0.54 (−0.77 to −0.30) | 19, 8 | 78% |
| Endpoint values only (change-only rows dropped) | −0.61 (−0.86 to −0.36) | 17, 7 | 80% |

#### What the hydration result means

With the paper values, the hydration estimate is larger than Batool's: 0.58 to 0.77 depending on the choices above, against 0.44. The strict endpoint-only analysis gives 0.61. Batool's errors understated the hydration effect. Heterogeneity stays high (I² about 80%), partly because many trials appear at several time points; the multilevel model gives the same answer.

#### What the elasticity result means

With the paper values, the estimate is smaller than Batool's: 0.45 to 0.52 depending on the choices above, against 0.62. The trials also agree more closely, with I² of 51% to 57% against 93%. The corrected interval excludes zero, so their conclusion that collagen improved elasticity still holds, at a smaller size.

#### What the roughness result means

The estimate barely changes, but it rests on very different measures pooled together: wrinkle profiles, replica roughness and visual grades. Heterogeneity stays high (I² 76% to 87%). In the change-score sensitivity analysis, the cluster-robust interval crosses zero (−1.38 to 0.06).

#### Multilevel model

It nests time points and Inoue's two arms within each trial. Sugihara 2015 and Inoue 2016 report an identical placebo group, so they are treated as one cohort. Cluster-robust intervals rest on only 5 to 20 clusters. The single-level rows in the tables count repeated time points as if they were independent, the same simplification I criticise in Batool (issues file, item 7). The multilevel results are the check on that, and they agree.

Further problems in the paper are listed in [`batool/batool-2026-issues.md`](batool/batool-2026-issues.md).

#### Charted values

Some re-extracted values were read from charts: Vleminckx, Zague (all three rows), Baek's control arm, both Yoon hydration rows, Yoon elasticity, and some change scores (Lee 2023 hydration, Kim 2018, Bolke). They are flagged in `re-extraction.csv`, with the readings in the notes.

#### My reading

Batool's printed study-level values can't be relied on. With every row taken from the trial papers, the estimates are about 0.6 for hydration and 0.5 for elasticity in collagen's favour, and about −0.6 for roughness, with high heterogeneity for hydration and roughness. Most of these trials also appear in Analysis 1, so this is not independent confirmation.

Thanks to Avi Bitterman for pointing out the Koizumi roughness error and the Seong omission, which led me to re-extract the whole analysis.

---

## Analysis 3: collagen-only products, Grimes & Mahto data (a separate question)

Both meta-analyses include products that combine collagen with other active ingredients (vitamins, antioxidants, coenzyme Q10, astaxanthin, ornithine, hyaluronic acid, chondroitin). This analysis uses the corrected Grimes and Mahto data. It keeps only trials where collagen was the only active ingredient that differed between the arms, according to the trial report.

- Kept despite minor extras: Kim 2018 (100 mg vitamin C in both arms) and Jung 2021 (vitamin C in the drink base; the placebo's contents aren't itemised).
- Excluded as multi-ingredient: Ito, Nomoto, Genovese, Czajka, Yoon, Žmitek, Campos, Bolke, Schwartz, di Cerbo.
- Asserin 2015 (two collagen arms against placebo) is collagen only and is now included. An earlier version excluded it because its paper hadn't been checked.

| Collagen-only products, Grimes & Mahto data | k | SMD (95% CI) |
|---|---|---|
| Elasticity | 8 | 0.44 (0.15 to 0.72) |
| Elasticity, placebo-controlled only (excluding Choi) | 7 | 0.37 (0.10 to 0.64) |
| Elasticity, Cutometer R2 only | 6 | 0.49 (0.27 to 0.71) |
| Elasticity, excluding Tak (direction unclear) | 7 | 0.53 (0.32 to 0.73) |
| Elasticity, excluding Sugihara (shares Inoue's placebo group) | 7 | 0.42 (0.09 to 0.75) |
| Hydration | 9 | 0.50 (0.19 to 0.80) |
| Hydration, placebo-controlled only (excluding Choi) | 8 | 0.48 (0.16 to 0.80) |
| Hydration, excluding Jung | 8 | 0.54 (0.21 to 0.87) |
| Hydration, excluding Sugihara | 8 | 0.52 (0.18 to 0.87) |

The elasticity estimates are a little smaller than the all-product result, and the trials agree more closely. The hydration estimate rose from 0.31 in an earlier version to 0.50, mainly because the Miyanaga row was corrected and Asserin was added. The t-based prediction intervals include zero (elasticity −0.38 to 1.25; hydration −0.42 to 1.41). The trials are still compared mostly against non-protein placebos, and most were funded or supplied by manufacturers.

---

## Analysis 4: collagen-only products, Batool data (a separate question)

This uses the re-extracted Batool data from Analysis 2 (endpoint values primary) and keeps only trials where collagen was the only active ingredient that differed between the arms.

- Kept for hydration: Inoue 2016, Demir-Dora 2024, Lee 2023, Lee 2025, Zague 2025, Proksch 2025, Morakul 2024, Tak 2021, Evans 2021, Vleminckx 2024, Kim 2018, Choi 2014, Koizumi 2018.
- Kept for elasticity: Lee 2023, Inoue 2016, Seong 2024, Sugihara 2015, Vleminckx 2024, Kim 2018, Koizumi 2018, Kim 2022, Choi 2014, Ahi 2024.
- Kept for roughness: Inoue, Sugihara, Lee, Seong, Koizumi, Demir-Dora 2024.
- Excluded as multi-ingredient: Nomoto, Ito, Bolke, Schwartz, Yoon, Žmitek, Lin. Baek 2025 is excluded because its composition is unclear (a judgement call).

| Collagen-only products, Batool data (re-extracted) | SMD (95% CI) | Rows, trials |
|---|---|---|
| Hydration | 0.61 (0.38 to 0.84) | 23, 13 |
| Hydration, multilevel model with cluster-robust CI | 0.60 (0.25 to 0.95) | 23, 13 |
| Hydration, endpoint values only | 0.60 (0.36 to 0.84) | 22, 12 |
| Elasticity | 0.40 (0.22 to 0.57) | 15, 10 |
| Elasticity, multilevel model with cluster-robust CI | 0.40 (0.25 to 0.54) | 15, 10 |
| Elasticity, placebo-controlled only (excluding Choi) | 0.37 (0.20 to 0.54) | 14, 9 |
| Elasticity, change scores wherever reported | 0.48 (0.32 to 0.64) | 15, 10 |
| Elasticity, endpoint values only | 0.38 (0.22 to 0.54) | 13, 8 |
| Roughness (negative favours collagen) | −0.57 (−0.74 to −0.39) | 17, 6 |
| Roughness, multilevel model with cluster-robust CI | −0.53 (−0.88 to −0.18) | 17, 6 |
| Roughness, endpoint values only | −0.63 (−0.85 to −0.40) | 12, 4 |

The collagen-only elasticity estimate (0.37 to 0.48) is close to Analysis 3's 0.44. The collagen-only hydration estimate (0.61) is a little higher than Analysis 3's 0.50, from a largely different set of trials. For elasticity the two analyses share Inoue, Sugihara, Koizumi, Kim 2018 and Choi; for hydration, Inoue, Koizumi, Choi, Kim 2018 and Tak. So this is not independent confirmation.

---

## How to reproduce

```
Rscript analysis/reanalysis.R          # Analyses 1 and 3
Rscript analysis/batool-reanalysis.R   # Analyses 2 and 4
```

You need R with the `metafor` and `readxl` packages.

- `reanalysis.R`:
  1. checks the two Data S1 spreadsheets against their MD5 hashes (`c15a061f…`, `e341794f…`);
  2. stops if any "published" value in `corrections.csv` doesn't match Data S1;
  3. reproduces all ten rows of Grimes and Mahto's Table 2;
  4. applies the corrections, then writes `data/corrected/` and `analysis/results.txt`.
- `batool-reanalysis.R`: stops unless it reproduces Batool's printed results and weekly subtotals.

#### Data S1 orientation

Grimes and Mahto's script (`elastic_regs_complete.R`, lines 9 to 23 and 44 to 48) passes `ME/SE/NE` as group 1 and `MC/SC/NC` as group 2 to `escalc("SMD")`. So `ME` is the collagen arm, and a positive value favours collagen. Their hydration rows for Choi, Ito, Nomoto and Koizumi have collagen in `ME`, which confirms this.

#### SHA-256 of the Data S1 files

| File | SHA-256 |
|---|---|
| `DataS1-original-archive.rar` | `3b9af1b61924b157fe6077745eec5054ea0a44fd95d5a5cddcd1955ec9a84871` |
| `allelasticfinal.xlsx` | `451a794ca95f37856af89b7554bf8d4d8fc5f7c008c1ae5ac69500617a45c165` |
| `hydrodata.xlsx` | `2569162b9151746f3ddbba35a3873258c22de9ad4f6b87395a6be1054f65fcb3` |

## Files

| Path | What it is |
|---|---|
| `data/grimes-mahto-2026-data-s1/` | Data S1 as published (spreadsheets, R code, ReadMe, original archive) |
| `corrections/corrections.csv` | every Data S1 correction: published value, corrected value, source table and page, direction |
| `corrections/earlier-meta-analyses.csv` | how de Miranda 2021 and Pu 2023 entered the same 8 trials |
| `analysis/reanalysis.R`, `analysis/results.txt` | Analyses 1 and 3 |
| `data/corrected/` | corrected Data S1, and the published version as CSV. The Notes and sponsor columns are copied verbatim from Data S1. |
| `data/batool-2026/figure-values.csv`, `figure-values-hydration.csv` | study-level values as printed in Batool's Figures 4, 5 and 8 |
| `data/batool-2026/re-extraction.csv` | every Batool hydration, elasticity and roughness row re-extracted from the trial papers (source, inputs, how Batool's value arises; change-score inputs in the notes) |
| `analysis/batool-reanalysis.R`, `analysis/batool-results.txt` | Analyses 2 and 4 |
| `batool/batool-2026-issues.md` | further problems in Batool 2026 |

## Licence and credit

- Data S1 is supplementary material to an open-access article published under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). It is reproduced unmodified, with credit to Grimes and Mahto.
- Batool's figure values are transcribed from an open-access article (CC BY 4.0), with credit.
- My text, tables and data are CC BY 4.0, and my code is MIT (see `LICENSE`).
- Trial PDFs are not included because they are copyrighted. Every value cites its table and page.

Thanks to David Robert Grimes and Anjali Mahto for publishing their data and code, and to Avi Bitterman for asking for this audit to be published.
