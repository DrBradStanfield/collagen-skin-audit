# Batool et al. 2026: problems found

Batool A, et al. *Oral collagen peptides and skin rejuvenation: a systematic review and an updated meta-analysis of randomized controlled trials.* J Cosmet Dermatol 2026;25(7):e71041, [doi:10.1111/jocd.71041](https://doi.org/10.1111/jocd.71041). Supporting information: `jocd71041-sup-0001-TableS1-FigureS1-S6.docx` on the article page.

This 2026 meta-analysis (35 trials) reported hydration SMD 0.44 (0.15 to 0.73), elasticity 0.62 (0.15 to 1.10) and skin roughness −0.57 (−1.06 to −0.08). I cited it in my video as reaching numbers similar to the corrected Grimes and Mahto data. The README's Analysis 2 re-extracts every hydration, elasticity and roughness row from the trial papers, and this file lists what I found. Avi Bitterman first raised the Koizumi roughness and Seong points (items 3 and 4).

## 1. Most hydration rows are wrong (Figure 4)

Supplementary Figure S1I prints the inputs behind each hydration row. 17 of the 31 rows in Figure 4 are wrong, and an 18th (Yoon week 12) probably is. Two more have sample-size slips that barely change the value, and one (Evans) has the right numbers for the wrong measure (the `verdict` column in the CSV). Examples:

| Row | Batool | From the paper | What Batool used |
|---|---|---|---|
| Inoue 2016 (L-CP), week 8 | −2.36 | 0.23 | That arm's elasticity (R2) as its "moisture" |
| Morakul 2024, week 8 | −0.81 | 1.66 | Two placebo values (weeks 10 and 8); SEMs as SDs |
| Lin, week 8 | 0.00 | 1.10 | The placebo's week-8 value in both arms |
| Yoon 2014, week 12 | 1.30 | 0.28 (0.55 if the bars are 95% CIs) | The chart's unlabelled error bars as SDs; as SDs they would imply a difference the paper's "not significant" makes unlikely |
| Zague 2025, week 4 | 1.02 | 0.36 | The collagen arm one time point later |

Batool's "Yoon 2014, week 2" row has no week-2 measurement behind it. The two hydration rows Batool removed as outliers (Supplementary Figure S1A) were extraction errors, both in collagen's favour:
- Morakul: printed +8.37; the paper gives 0.88. Batool compared collagen at week 8 with placebo at week 4, with SEMs as SDs.
- Koizumi: printed +5.19; the paper gives 0.87 (SEMs as SDs).

Baek 2025 is included although its eligibility is doubtful. Baek 2025's product is a hibiscus enzyme extract marketed as a plant-based "collagen alternative". Its ingredient list (supplementary Table S4a) names no collagen, but its amino-acid analysis (Table S4b: glycine 19%, hydroxyproline 9.7%, proline 6.9%) looks like collagen, so what it contains is unclear. Evans 2021's hydration outcome is a self-rated questionnaire. Re-extracted, the hydration estimate is 0.58 to 0.77 instead of 0.44 (README, Analysis 2).

## 2. Most elasticity rows use the wrong cells from the trial papers

Supplementary Figure S2D prints the inputs (n, mean, SD) behind each elasticity row, so each printed value can be traced to its source cells. 16 of the 19 rows in Figure 5 pair the wrong cells. The other three have smaller errors: sample sizes, and a chart reading. Every row, with its source page and table, is in [`../data/batool-2026/re-extraction.csv`](../data/batool-2026/re-extraction.csv).

Examples (the paper's endpoint value, with change from baseline in brackets where it differs):

| Row | Batool | From the paper | What Batool used |
|---|---|---|---|
| Ahi 2024, week 12 | 3.59 | 0.21 | Placebo hydration as the control value |
| Schwartz 2019, week 12 | 2.64 | 0.50 | The collagen arm's own baseline as the control |
| Bolke 2019, week 12 | 1.94 | 1.16 | The placebo's baseline as the control |
| Koizumi 2018, week 12 | 0.30 | 0.93 (change only) | Placebo moisture change as the control; SEMs as SDs |
| Nomoto 2020, week 8 | 0.15 | 1.20 (0.67, adjusted) | The collagen arm's week-6 value as the control |
| Choi 2014, week 12 | 1.32 | 1.61 | The control arm's baseline as the control |
| Inoue 2016 (H-CP), week 8 | 0.45 | 0.94 (1.16) | The placebo's baseline as the control |

The errors run in both directions. With every row taken from the papers, the elasticity estimate is 0.45 to 0.52 depending on the choice of endpoint or change values, instead of 0.62 (README, Analysis 2).

## 3. The removed "extreme negative outliers" were extraction errors

Section 3.2.2 says the all-trials elasticity result (SMD −0.00, −0.99 to 0.98) was "heavily distorted by two extreme negative outliers at week 12 [29, 39]". Supplementary Figure S2A shows the two removed rows:

- Yoon 2014: −7.89. From the paper (Table 1 baselines, the Results text and Fig. 1, change in R2 from baseline), the value is +0.68. The error bars in Fig. 1 are read from the chart; the paper's reported p = 0.035 implies about 0.64. A value as extreme as −7.89 most plausibly comes from comparing a change score with an absolute level, though I could not reproduce it exactly.
- Žmitek 2020: −6.08. From the paper (Nutrients 12:618, section 3.3, viscoelasticity at week 12; higher is better per section 2.6), the value is −0.39.

Reference 39 is Žmitek, which matches. Reference 29 is Seong 2024, not Yoon. Batool includes Seong only at weeks 4 and 8 (0.28 and 0.42). Its week-12 result, Cutometer R2 0.74 (0.06) vs 0.70 (0.07) with n = 45 and 42, is +0.61 and is missing. Every Seong elasticity parameter favours collagen at week 12.

## 4. Roughness: standard errors used as standard deviations, and a reversed sign (Figure 8)

- Koizumi (labelled "Koizumi 2017"): −0.60 at 6 weeks and −5.53 at 12 weeks. These match Koizumi's R1 roughness (Table 2, "Data are expressed as mean ± SEM") with SEMs used as SDs. Converted to SDs, they are −0.10 and −0.93. This is the same error Grimes and Mahto criticised in the earlier meta-analyses.
- Demir-Dora 2024 (J Clin Med 13:5370): +0.84, +0.74 and +0.71. The paper states "Higher values were considered to indicate amelioration of skin roughness" (section 2.5). Batool's values reproduce as collagen minus placebo on that scale, so in a plot where negative favours collagen, the signs are reversed. Batool's "week 12" for this trial is also 4 weeks after dosing stopped.

The remaining roughness rows match the papers, apart from small sample-size slips (Sugihara weeks 4 and 8, Schwartz week 6), a control SD in Sugihara week 8, and an apparent typo in the paper's own Schwartz week-6 endpoint. The result doesn't hinge on Demir-Dora: without its three rows the estimate is −0.54 (−0.77 to −0.30). Re-extracted, the roughness estimate is −0.57 (−0.77 to −0.37), the same as Batool's printed −0.57. The measures pooled are very different from one another, though, and heterogeneity remains high.

## 5. The "independent trials" claim

The Discussion says: "Independently conducted trials [44, 48] reported effect sizes comparable to those observed in sponsored studies."

- Reference 44 is Koizumi, printed with the wrong title, journal and year; the authors and Table 1 details match Koizumi 2018. Koizumi 2018 states: "This study was funded by Ju Yeong NS Co. LTD. and Nitta Gelatin Inc." Those companies made and supplied the product, and five of the six authors list one of them as their affiliation (three Nitta Gelatin, two Ju Yeong NS).
- Reference 48 is Yoon 2014, printed with the wrong issue and pages and a placeholder DOI. Yoon 2014 states: "This study was funded by Cerebos Pacific Limited."

Both trials may have been run by independent investigators. Koizumi says its analyses were "carried out independently by the clinical trial center of Ellead". But both were industry-funded, so they can't show that industry funding makes no difference. No funding or registration subgroup analysis is presented.

## 6. The "skin density" figure reproduces the TEWL data

Figure 9 (skin density) has the same 26 study and time-point estimates as Figure 6 (transepidermal water loss, TEWL), rearranged. It also has the same pooled estimate, −0.39 (−0.62 to −0.16), and the same heterogeneity statistics (I² 76.5%, τ² 0.2760).

## 7. The same trials and participants counted more than once

- Repeated time points. Forest-plot totals pool several rows from the same trial as if they were independent.
  - The hydration plot (Figure 4) includes Demir-Dora, Zague and Lee 2023 three times each, and Lee 2025, Proksch 2025, Lin, Inoue (L-CP), Yoon and Nomoto twice each.
  - The TEWL plot (Figure 6) has 10 Miyanaga rows: two doses and two skin sites at up to three time points, all against one placebo group.
- Shared placebo group. Sugihara 2015 and Inoue 2016 report an identical placebo arm (n = 26, the same values at every time point). It is counted as a separate control each time.

## 8. Outlier removal

In the elasticity analysis, the two rows removed as negative outliers (item 3) were extraction errors. The large positive rows kept were extraction errors too: Ahi 3.59, Schwartz 2.64 and Bolke 1.94 (item 2).

In hydration, Batool removed two results that favoured collagen (Supplementary Figure S1A): Koizumi (+5.19) and Morakul 2024 (+8.37). The text calls the second "Morioka 2024". Both were extraction errors; from the papers they are 0.87 and 0.88 (item 1).

## 9. Other problems

- Multi-ingredient products. Exclusion criterion 2 rules out "interventions where oral collagen was heavily confounded by the co-administration of other active aesthetic ingredients (e.g., vitamins, hyaluronic acid, or other botanical extracts) unless the effects could be statistically isolated". Yet several such products are included, and none separates the collagen effect: Schwartz 2019 (with chondroitin and hyaluronic acid), Žmitek 2020 (with coenzyme Q10 and vitamins), Czajka 2018 (with vitamins), Yoon 2014 (with astaxanthin), Bolke 2019 (with vitamins and zinc) and Ito 2018 (with ornithine).
- Inclusion criteria. Baek 2025 tests a hibiscus extract marketed as a plant-based "collagen alternative", with no collagen in its ingredient list (supplementary Table S4a). Its eligibility under inclusion criterion 2 (oral collagen peptides or collagen-based supplements) is doubtful, though its amino-acid analysis (Table S4b) looks collagen-like.
- Reference and labelling errors:
  - Reference 39 (Žmitek) gives a BioFactors citation whose DOI (10.1002/biof.1565) belongs to an unrelated paper; the trial is Nutrients 2020;12:618.
  - Reference 28 (Demir-Dora) gives the wrong first author, title and journal ("C. L. Dora … Clinical Efficacy of Collagen-Based Nutraceutical CollaSel Pro … Clinical, Cosmetic and Investigational Dermatology"); the trial is J Clin Med 2024;13:5370.
  - Reference 46 (Sugihara) cites a J Nutr Food Sci 2015 paper I could not obtain; every Sugihara input Batool used matches Sugihara, Jpn Pharmacol Ther 2015;43:67-70.
  - Placeholder DOIs (for example, "10.1089/jmf.2012.xxx").
  - The same trial cited twice under different references (Ito, Morakul, Inoue, Proksch 2014, Žmitek).
  - Seong listed twice in Table 1, with different countries.
  - Zague 2025 is cited as Skin Research and Technology 28(9); the paper is J Med Food 28(9):869-876. Morakul's reference 52 ("Marine Drugs") appears to be the J Cosmet Dermatol 2024 paper.
  - "Kim 2021" and "Lin 2020" in the figures are Kim 2018 (Nutrients 10:826) and Lin 2021 (J Cosmet Dermatol 20:188). Table 1 cites Lin as reference 15, which is a knee-osteoarthritis meta-analysis.
- Participant counts. Supplementary Table S1 gives 35 studies and the same participant numbers for every outcome, including outcomes that pool far fewer trials.
- Registration and data. The published version still says PROSPERO "registration details withheld for blinded review", and data are available only on request.
