# Blind extraction of the four figure-read trials (16 October 2026)

Campos 2015, di Cerbo 2015, Asserin 2015 and Miyanaga 2021 were corrected on 16 October 2026 from values read off figures. Each paper was given, with nothing else, to a separate AI extraction run (Anthropic Claude Sonnet) that did not see this repository's values. Its readings agree with corrections.csv rows E11, E12, H7, H8 and H11 to within reading precision: Campos 0.533 ± 0.037 vs 0.459 ± 0.025; di Cerbo elasticity 24.92 (SEM 0.45) vs 24.42 (0.33) and hydration 60.77 (1.19) vs 54.73 (1.08); Asserin Peptan P 64.7 (2.5), Peptan F 57.5 (3.0), placebo 52.5 (2.7); Miyanaga 5 g +16.34 vs placebo +6.53 (SD 7.5), with the same unresolvable error-bar cap (5 g SD 9.5 or 11.0). Its full report follows, unedited apart from local file paths.

```
BLIND EXTRACTION REPORT: oral collagen and skin hydration/elasticity (4 trials)
Only the four PDFs in the blind4 folder were used (pdftotext, PyMuPDF drawing coordinates, pdfimages, rendered pages). No other files, no web. Working files (scripts/renders) are in the scratchpad's b4out/ folder.

Conventions: PDF p = PDF page number (1 = first page). "Journal p" is the printed page. Every number marked "printed" is copied exactly; every "est." is my figure reading. Where an error bar belongs to an unknown arm I say so and give both readings. Nothing converted SEM<->SD.

================================================================
1. CAMPOS 2015 (Clin Pharmacol Biopharm 4:3, 1000142; 6 PDF pages)
================================================================
Design: double-blind, randomised, placebo-controlled, parallel. 60 women, 40-60 y; 30 randomised per group. Analysed n per cell is NOT stated (flow/dropouts not reported), so n = 30 per arm is the randomised n.
Arms: Group A = hydrolysed collagen + vitamins (the "Collagen Based" bars) = COLLAGEN. Group B = placebo (maltodextrin 10 g) = CONTROL.
Collagen dose as stated: "a daily dose of either 10 g of collagen and a mix of vitamins A, C, E and zinc or 10 g of the placebo (maltodextrin)" (PDF p2). Per 10 g (Tables 1-2): hydrolysed-collagen amino acids incl. glycine 1574 mg, proline 1206 mg, hydroxyproline 1161 mg; vitamin A 600 ug, C 45 mg, E 10 mg, zinc 7 mg. So the effect is collagen + vitamins/zinc combined.
Duration/timing: once daily for 90 days. Measurements "immediately before starting the product treatment (baseline values) and after 90 days (D90) of daily product intake" (PDF p2). Time since last dose not stated. Taken at home; room 21.5 +/-1 C, 50 +/-5% RH, 20 min acclimation.
Sites: frontal, periorbital, nasolabial (periorbital/nasolabial sides randomly chosen).
Statistics section (PDF p3): "Two-way ANOVA and Bonferroni post-test ... paired Student's T-tests for basal and T90 ... p < 0.05".

HYDRATION (Corneometer CM 825, arbitrary units, mean of 5 measurements per site)
- NO numeric values are printed anywhere (no table, no figure). Text only (PDF p3): collagen group "presented a significant effect in the stratum corneum water content parameter, but only in the frontal region, when compared to baseline values. However, this result is not significant when compared to placebo group." Other regions and the placebo group: no significant effect stated. Higher = more hydration is implied but never quoted.
- Nothing extractable for a meta-analysis (no mean, no SD/SEM).

ELASTICITY (Cutometer SEM 575)
- Methods: parameters named: Ua/Uf gross elasticity, Ur/Ue net elasticity, Ur/Uf biological elasticity, Uv/Ue. "The R5 value (Ur/Ue, immediate recovery/elastic deformation) was utilized". Only R5 is shown as a number-bearing figure, and only for the FRONTAL region. Text says collagen group had significant changes "in all evaluated parameters" vs baseline but no values for any other parameter or region.
- Higher is better, quote (Fig. 1 legend, PDF p4): "R5 Parameter (Net Elasticity - The closer to the value is to 1, the more elastic the skin)".
- Dispersion type: NOT stated anywhere (unlabelled error bars in Fig. 1; legend and statistics section never say SD or SEM) = "unclear".
- Values: Figure 1 (bar chart, PDF p4, vector drawing). Endpoint (absolute R5), not change.
  Axis calibration (PDF points, y down): 0.2 -> y=210.82; 0.3 -> 194.52; 0.4 -> 178.22; 0.5 -> 161.92; 0.6 -> 145.62 (16.30 pt per 0.1). x-axis baseline at y=243.34 = 0.000 (bars start at zero).
  Bar top = top stroke line; error bar = two-sided symmetric (cap lines at top and bottom, mean at midpoint).

  Arm / time | n | bar-top y | caps y (top, bottom) | est. mean R5 | est. half error bar
  Placebo D0 | 30 (randomised) | 188.74 | 185.88, 191.51 | 0.336 | 0.017
  Placebo D90 | 30 | 168.69 | 164.53, 172.76 | 0.459 | 0.025
  Collagen D0 | 30 | 193.05 | 190.04, 196.15 | 0.309 | 0.019
  Collagen D90 | 30 | 156.54 | 150.51, 162.58 | 0.533 | 0.037
  Reading precision about +/-0.003. Significance marker: "*" over Collagen D90 only (vs baseline and vs placebo, per text PDF p3).
  Note both arms rise from D0 to D90 (placebo +0.12); the baselines differ slightly (0.336 vs 0.309).
- Other regions (periorbital, nasolabial) and all other Cutometer parameters: no values reported.
(Also printed but not skin hydration/elasticity: dermis echogenicity Fig 7, pores/wrinkles.)

================================================================
2. DI CERBO 2015 (J Photochem Photobiol B 144:94-103; 10 PDF pages)
================================================================
Design: Study 2 of two studies is the RCT: 30 women (age 43.6 +/-1.2 y, mean +/- SEM) with moderate (n=22) or severe (n=8) facial photoaging, randomised to active (n=15) or placebo (n=15). Analysed n per cell is not stated, so n = 15 per arm is the randomised n. (Study 1 = 30 photoaged vs 30 healthy, cross-sectional, no collagen; its Fig 2 values were not extracted.)
Arms: VISCODERM Pearls (labelled "Dietary supplement" in figures) = COLLAGEN-containing multi-ingredient product. Placebo = starch 200 mg = CONTROL. Product is not collagen alone: Pycnogenol 15 mg, collagen 124 mg, chondroitin sulfate 40 mg, glucosamine sulfate ("not less than 3%"), low-molecular-weight hyaluronic acid (printed "(20 mg)" after it), coenzyme Q10 10 mg (PDF p4).
Daily collagen dose as stated: "collagen (124 mg) ... 2 times a day for 4 weeks" (124 mg per administration; 248 mg/day is my arithmetic, the paper does not give a daily total). Placebo also twice a day for 4 weeks. Standardised 1800 kcal diet in both groups.
Timing: "at baseline and 2 weeks after the end of treatment" i.e. about week 6 from start (2 weeks after the 4-week dosing ended); time since last dose = 2 weeks.
Instrument: "Skin Tester" (Selenia Italia): ultrasound beam reflection (stromal density, vascular tone) plus impedance; units arbitrary (no unit on axes). There is no Cutometer. Elasticity, hydration and tonicity all come from this device.
Dispersion: Statistics section (PDF p4): "All data are presented as the means +/- SEM." Fig. 3 legend does not restate it. I treat the error bars as SEM. Two-way ANOVA with Sidak's test.
Higher is better: implied, not an explicit quote: "elasticity, hydration and tonicity were decreased in patients affected by photoaging, if compared with healthy controls (all p < 0.0001; Fig. 2C-E)". Also "Dehydration, atrophy and loss of elasticity characterize the aged skin".
No numbers are printed in the text/tables for these parameters; all values are from Fig. 3 (vector bar chart, PDF p6; journal p99). All are endpoint values (absolute, not change). Panels: A pH, B sebum, C Elasticity, D Hydration, E Tonicity.
Printed statistics: "no difference in facial skin pH (Fig. 3A) and elasticity (Fig. 3C) was observed between placebo and dietary supplement groups 2 weeks after the end of treatment. Facial sebum, hydration and tonicity were increased in the active treatment group vs. placebo ... (Fig. 3B, D and E; p < 0.0001, p < 0.0001 and p < 0.05, respectively)". Fig 3 markers: Sebum **** , Hydration **** , Tonicity * (post-treatment, supplement vs placebo).
Error bars are drawn UPWARD ONLY (cap above the bar top); half bar = cap minus bar top. The 4 bars per panel: Placebo pre, Supplement pre, Placebo post, Supplement post.
Axis calibrations (PDF points, y down):
 C Elasticity: 0 -> y=311.12; 10 -> 282.42; 20 -> 253.76; 30 -> 225.06 (2.869 pt/unit)
 D Hydration: 0 -> 311.08; 20 -> 289.55; 40 -> 268.05; 60 -> 246.52; 80 -> 225.02 (1.0768 pt/unit)
 E Tonicity: 0 -> 455.38; 10 -> 433.89; 20 -> 412.35; 30 -> 390.85; 40 -> 369.32 (2.15 pt/unit)
 (For reference: A pH 0 -> 170.12, 8 -> 84.10; B Sebum 0 -> 170.12, 30 -> 84.06.)

 Parameter | arm, time | n | bar top y | cap y | est. mean | est. SEM (cap-bar)
 Elasticity (C) | Placebo pre | 15 | 245.80 | 243.87 | 22.77 | 0.67
 Elasticity | Supplement pre | 15 | 245.79 | 243.87 | 22.77 | 0.67
 Elasticity | Placebo post | 15 | 241.07 | 240.11 | 24.42 | 0.33
 Elasticity | Supplement post | 15 | 239.63 | 238.35 | 24.92 | 0.45
 Hydration (D) | Placebo pre | 15 | 252.48 | 251.24 | 54.47 | 1.15
 Hydration | Supplement pre | 15 | 251.40 | 249.88 | 55.48 | 1.41
 Hydration | Placebo post | 15 | 252.20 | 251.04 | 54.73 | 1.08
 Hydration | Supplement post | 15 | 245.71 | 244.43 | 60.77 | 1.19
 Tonicity (E) | Placebo pre | 15 | 395.38 | 393.58 | 27.89 | 0.84
 Tonicity | Supplement pre | 15 | 393.77 | 392.05 | 28.64 | 0.80
 Tonicity | Placebo post | 15 | 393.85 | 392.01 | 28.60 | 0.86
 Tonicity | Supplement post | 15 | 390.05 | 388.77 | 30.36 | 0.59
 (Extra, same figure: pH plc pre 6.15/0.10, sup pre 6.19/0.04, plc post 5.86/0.13, sup post 5.87/0.13; Sebum plc pre 21.73/0.46, sup pre 21.85/0.53, plc post 22.26/0.40, sup post 24.73/0.28.)
 Reading precision: about +/-0.1 for elasticity, +/-0.3 hydration, +/-0.2 tonicity. Elasticity is the "Skin Tester" elasticity; no other elasticity parameter exists. No site breakdown (face, single score). Caveat: baselines already differ by ~1 unit in hydration and tonicity between arms (hydration: 54.5 vs 55.5), and the paper's hydration/tonicity effects are single post-treatment between-group comparisons.

================================================================
3. ASSERIN 2015 (J Cosmet Dermatol 14:291-301; 11 PDF pages)
================================================================
Two RCTs. Only Clinical study 1 measured skin hydration (Corneometer). Neither study measured skin elasticity (no Cutometer or elasticity parameter anywhere). Study 2 (n=106, 10 g Peptan F, 84 days) measured dermal echogenicity (ultrasound) and collagen fragmentation (confocal), not hydration; so it has no hydration or elasticity data. Nothing to extract from it for these outcomes.
Study 1 (SOUKEN Laboratories, Tokyo, 2008): minimised, placebo-controlled, parallel, double-blind. 60 screened, 33 randomised, 11 per arm, all 11 analysed in each (Fig 1; "All participants finished the study"). So n = 11 per cell, analysed.
Arms: Placebo (dextrin) = CONTROL; Peptan F (fish collagen peptides) = COLLAGEN; Peptan P (porcine collagen peptides) = COLLAGEN (two collagen arms, different origin).
Dose as stated: "10 g placebo or 10 g Peptan" per day; "formulated drink at bedtime"; "56 consecutive days" (8 weeks). Measurement at baseline, 4 weeks and 8 weeks, "in a controlled environment ... 22 +/-1 C, 50 +/-10% RH after 30 min acclimatisation"; timing relative to the bedtime dose is not stated.
Parameter: skin moisture level by Corneometer (conductance), arbitrary units, "at three different application points per subject". Site is not specified beyond that (face assumed "facial skin parameters" per Methods, but not stated per site). TEWL (Tewameter) "not different ... (data not shown)".
Higher is better: "Aging of the skin is associated with a decrease in water content" and "Peptan seems to effectively improve skin hydration" (increase in moisture = improvement).
Dispersion: Fig. 2 legend: "Values are presented as mean +/- SEM. Statistical differences were calculated by ANOVA and Dunnett's post hoc test with *P<0.05, **P<0.01, ***P<0.001; *comparison with baseline, section-sign comparison with placebo." Endpoints (absolute), not change.
Printed numbers (text, PDF p4): "oral intake of Peptan F over 8 weeks led to a significant increase of skin moisture level by 12%"; "Peptan P significantly increased skin moisture level by 16% already after 4 weeks of treatment and as much as 28% after 8 weeks (P = 0.003 vs placebo at 8 weeks)"; "no change in the placebo group". No table of means. Percent changes are as printed (baseline-relative, per the text; unclear whether of group mean).
Figure 2 (PDF p4 = journal 294): a raster JPEG (615 x 416 px, 200 ppi) embedded in the PDF, so values are pixel readings. Native image pixel coords (y down): ticks 75 -> y=7; 70 -> 51; 65 -> 94; 60 -> 136; 55 -> 179; 50 -> ~223.5; 45 -> ~266.5; 40 -> 310; 35 -> 353 (8.65 px per unit; value = 35 + (353 - y)/8.65). Time points: 0w x~162, 4w x~342, 8w x~523 (native px). Error bars are drawn UPWARD ONLY (caps). Markers: placebo = blue triangle, Peptan F = red diamond, Peptan P = dark-red square (centres below).
 Arm / time | n | marker centre y (px) | cap y (px) | est. mean (arb. units) | est. SEM
 Placebo 0w | 11 | ~216 | 195.5 | ~50.8 (low confidence, overlapped markers) | ~2.4
 Placebo 4w | 11 | ~202.5 | 184.5 | 52.4 | 2.1
 Placebo 8w | 11 | ~201.5 | 178.5 | 52.5 | 2.7
 Peptan F 0w | 11 | ~213.5 | 188 | ~51.1 (low confidence; text +12% at 8w implies ~51.4) | ~3.0
 Peptan F 4w | 11 | 169 | 136 | 56.3 | 3.8
 Peptan F 8w | 11 | 158 | 132 | 57.5 | 3.0
 Peptan P 0w | 11 | ~217.5 | 201.5 | ~50.7 | ~1.9
 Peptan P 4w | 11 | 148 | 124.5 | 58.7 | 2.7
 Peptan P 8w | 11 | 96 | 74 | 64.7 | 2.5
 Cross-check against the text: P 64.7/50.7 = +28% at 8w and 58.7/50.7 = +16% at 4w, matching. Baseline (0w) readings are the least reliable because three markers overlap. Significance marks on the figure: Peptan P 8w "***" (vs baseline) and "section-signs" (vs placebo), Peptan F 8w "*" (vs baseline).

================================================================
4. MIYANAGA 2021 (Skin Pharmacol Physiol 34:115-127; 13 PDF pages)
================================================================
Design: randomised, double-blind, placebo-controlled; 99 Japanese women 35-50 y, dry skin; 33 per arm randomised. Nov 2015-Mar 2016.
Arms: Placebo (collagen-free drink) = CONTROL; CP (1 g) = COLLAGEN low dose; CP (5 g) = COLLAGEN high dose (collagen peptide FCP-Z, ~5 kDa).
Dose as stated: "Test beverages were prepared with 1 or 5 g of CP in 50 mL of water"; "50 mL/day ... ingested daily for 12 weeks before bedtime". Measurements at week 0 (before first drink) and weeks 4, 8, 12; time since last dose not stated (visit at the clinic after cleansing and 30 min acclimatisation, 21 +/-2 C, 45 +/-5% RH).
n: randomised 33/33/33. Table 2: subject number Placebo 33, CP(1 g) 31, CP(5 g) 33; Fig. 1: 2 excluded from analysis ("absence of measurements at 8 weeks"; text: 2 dropped before the trial, 97 in final analysis). So analysed n is 33 / 31 / 33; per-table-cell n is not separately stated, so I assume these. The flowchart text is jumbled but consistent with 31 in the CP 1 g arm.
Sites: cheek and forearm flexor side. Elasticity probes: 2 mm ("elasticity") and 6 mm ("deep elasticity").
Dispersion: Fig. 2-5 legends: "Data are presented as mean +/- SD". Tables 3-4 footnote: "Mean value +/- SD at weeks 0 and 12 and the changes from week 0 to week 12". Table 2 demographic values (age 43 +/-3.8 etc.; baseline SC moisture 28.00 +/-7.39, 27.26 +/-7.77, 27.86 +/-7.04) are unlabelled "+/-" (presumably SD; unclear). Statistics: "All results are presented as the change from baseline"; Steel test (when Bartlett p>=0.2) or Dunnett's test (p<0.2) vs placebo.
Time point caution: change from baseline at week 0 is 0 by construction.

4A. HYDRATION
(i) Stratum corneum water content, Corneometer (capacitance, arbitrary units) = PRIMARY outcome. Figure 2, PDF p5 (journal 119), vector. Values are CHANGE FROM BASELINE (absolute change, not percent). Placebo = square/dashed, CP 1 g = triangle, CP 5 g = circle (legend).
Panel a CHEEK. Axis (PDF pts): 30 -> y=77.72; 25 -> 99.32; 20 -> 120.92; 15 -> 142.52; 10 -> 164.12; 5 -> 185.72; 0 -> 207.32; -5 -> 228.92 (4.32 pt/unit). Marker centres = bounding-box centre of each vector marker (for triangles the centroid sits ~1.1 pt (0.25 unit) lower, i.e. the triangle estimates may be ~0.25 too high). Error bars are ONE-DIRECTIONAL, different directions per arm; only caps are drawn. Placebo bar points DOWN (confirmed: the down line starts at the placebo marker). The two CP bars point UP and overlap, so cap-to-arm assignment is not resolvable; I give both readings.
 Time | Placebo mean (marker y) / down cap | CP1g mean (y) | CP5g mean (y) | up caps (value, y)
 wk4 | 5.84 (182.07) / 0.23 (206.33) | 7.04 (176.90) | 6.10 (180.97) | 17.93 (129.86), 15.03 (142.40)
 wk8 | 4.25 (188.96) / -2.69 (218.92) | 10.84 (160.50) | 12.16 (154.80) | 21.40 (114.88), 19.52 (122.98)
 wk12 | 6.53 (179.11) / -0.97 (211.52) | 15.41 (140.73) | 16.34 (136.72) | 27.36 (89.13), 25.83 (95.74)
 wk0 | ~0.3 (205.98) | ~0.1 | ~0 | none
 Derived SD readings (est.): Placebo wk4 5.6, wk8 6.9, wk12 7.5. CP arms: assignment A (CP1g gets the higher cap): wk4 1g 10.9 / 5g 8.9; wk8 1g 10.6 / 5g 7.4; wk12 1g 12.0 / 5g 9.5. Assignment B (CP1g gets the lower cap): wk4 1g 8.0 / 5g 11.8; wk8 1g 8.7 / 5g 9.2; wk12 1g 10.4 / 5g 11.0. Marker n = 33 / 31 / 33.
 Printed significance on figure/text: cheek SC water vs placebo significant at wk8 and wk12 (1 g: p<0.01, p<0.001; 5 g: each p<0.001).
Panel b FOREARM. Axis: 12 -> y=77.72; 10 -> 92.84; 8 -> 107.96; 6 -> 123.08; 4 -> 138.20; 2 -> 153.32; 0 -> 168.44; -2 -> 183.56; -4 -> 198.68; -6 -> 213.80; -8 -> 228.92 (7.56 pt/unit).
 Time | Placebo mean (y) / down cap | CP1g mean (y) | CP5g mean (y) | up caps (value, y)
 wk4 | 1.47 (157.35) / -4.77 (204.49) | 3.63 (141.01) | 0.51 (164.60) | 10.46 (89.33), 5.71 (125.30)
 wk8 | -0.78 (174.36) / -6.46 (217.29) | 3.50 (141.96) | 1.68 (155.73) | 9.96 (93.17), 5.92 (123.70)
 wk12 | -1.00 (176.02) / -5.80 (212.29) | 2.97 (146.00) | 2.97 (145.99) | 8.44 (104.65), 8.11 (107.14)
 wk0 | ~0.1 | ~0 | ~0 | none
 Derived SD readings: Placebo wk4 6.2, wk8 5.7, wk12 4.8. CP: wk4 A (1g gets 10.46) 1g 6.8 / 5g 5.2, B 1g 2.1 / 5g 9.9; wk8 A 1g 6.5 / 5g 4.2, B 1g 2.4 / 5g 8.3; wk12 either way ~5.5 / ~5.1. (Fig 3 style analysis at wk8: a circle top edge coincides with the start of the long bar, which hints that the 5 g arm may carry the long bar; this is circumstantial only.)
 Significance (text): forearm SC water vs placebo: 1 g p<0.05 (wk8), p<0.01 (wk12); 5 g p<0.05 (wk12).
 Higher is better: not quoted explicitly for Corneometer; the paper treats increases as improvement ("increased the water content in the SC"); baseline selection was "low water content".

(ii) Epidermal water content, Moisture Meter D 0.5 mm probe (permittivity, arbitrary units) - SECONDARY. Figure 3, PDF p6 (journal 120), vector. Change from baseline, mean +/- SD (legend). Placebo down-bars; CP caps overlapped (same ambiguity).
 Panel a CHEEK. Axis: 8 -> y=80.57; 6 -> 98.50; 4 -> 116.42; 2 -> 134.34; 0 -> 152.26; -2 -> 170.18; -4 -> 188.10; -6 -> 206.03; -8 -> 223.95 (8.961 pt/unit).
  wk4: Placebo -0.50, CP1g 0.11, CP5g 0.20; caps up 4.11, 3.62, placebo down -4.84
  wk8: Placebo -0.76, CP1g 1.20, CP5g 1.65; caps up 4.93, 4.55, placebo down -5.83
  wk12: Placebo 0.10, CP1g 2.25, CP5g 2.33; caps up 6.10, 4.93, placebo down -2.62
  Placebo SD est.: 4.3, 5.1, 2.7 (wk4, 8, 12). CP SD est. (either arm order): wk4 3.4-4.0; wk8 2.9-3.7; wk12 2.6-3.9 (A: 1g 3.85 / 5g 2.60; B: 1g 2.68 / 5g 3.77).
  Text: cheek epidermal water significant vs placebo at wk12 only (1 g p<0.05; 5 g p<0.01).
 Panel b FOREARM. Axis: 5 -> y=80.57; 4 -> 96.51; 3 -> 112.44; 2 -> 128.37; 1 -> 144.30; 0 -> 160.23; -1 -> 176.16; -2 -> 192.09; -3 -> 208.02; -4 -> 223.95 (15.93 pt/unit).
  wk4: Placebo -0.21, CP1g 0.61, CP5g 0.85; caps up 3.46, 3.34, placebo down -2.47
  wk8: Placebo -0.65, CP1g 0.80, CP5g 1.09; caps: only ONE up cap visible 3.20 (the other coincides/hidden), placebo down -2.71
  wk12: Placebo -0.45, CP1g 0.90, CP5g 1.62; caps up 3.79, 3.31, placebo down -2.26
  Placebo SD est.: 2.3, 2.1, 1.8. Text: forearm epidermal water significantly increased at wk8 and wk12 (1 g each p<0.05; 5 g p<0.01, p<0.001).
(iii) Dermal water content, Moisture Meter D 1.5 mm probe - no significant differences at any time. Figure 4, PDF p7 (journal 121), vector; change from baseline, mean +/- SD (legend).
 Panel a CHEEK (axis 10 -> y=79.27; 5 -> 108.65; 0 -> 138.03; -5 -> 167.41; -10 -> 196.79; -15 -> 226.17; 5.876 pt/unit): wk4 Placebo 1.41, CP1g 0.48, CP5g not separately visible (hidden marker); wk8 Placebo -2.34, CP1g 0.62, CP5g -0.05; wk12 Placebo 0.35, CP1g 2.75, CP5g 2.04. Caps: wk4 up 6.02, 5.83, down -4.86; wk8 up 7.59, 4.70, down -9.88; wk12 up 8.83, 6.17, down -4.40.
 Panel b FOREARM (axis 6 -> y=79.27; 4 -> 100.26; 2 -> 121.24; 0 -> 142.23; -2 -> 163.22; -4 -> 184.20; -6 -> 205.19; -8 -> 226.17; 10.493 pt/unit): wk4 Placebo 0.14, CP1g 1.27, CP5g 0.97; wk8 Placebo -3.17, CP1g -1.59, CP5g -1.51; wk12 Placebo -0.76, CP1g -0.22, CP5g 0.67. Caps: wk4 up 4.16, 4.07, down -3.32; wk8 up 1.92, 1.62, down -1.62 (unattributed; looks like a second CP-arm bar) and -6.56 (placebo); wk12 up 3.01, 2.70, down -3.24.
 Arms and cap assignment have the same ambiguity as above. These are low-priority for hydration (not significant).
(iv) TEWL (Fig 5) is a barrier outcome; not extracted.

4B. ELASTICITY (Cutometer), values printed exactly. Table 3 (2-mm probe, PDF p8 = journal 122) and Table 4 (6-mm probe, PDF p9 = journal 123). Cell format: mean +/- SD; "0 wk" and "12 wk" are ENDPOINTS (absolute values); "Change" is the ABSOLUTE change from baseline (week 12 minus week 0). No percent values. Weeks 4 and 8: "data not shown". n: Placebo 33, CP1g 31, CP5g 33 (Table 2; per-cell analysed n not separately stated). Column order everywhere: Cheek [placebo | CP1g | CP5g], then Forearm [placebo | CP1g | CP5g].
Higher is better (Table 1 "Good evaluation" column, quoted): R0 "-*" (*"Due to interpretation"); R1 "Small value"; R2 "1"; R3 "-*"; R4 "Small value"; R5 "1"; R6 "Small value"; R7 "1"; R8 "Big value"; R9 "Small value"; F0 "0"; F1 "0"; F2 "Small value"; F3 "Big value"; F4 "Big value". Also (Methods, PDF p2): "F3 is the sum of the cumulative changes from 1 min of measurement; the higher the value, the greater the elasticity of the skin". Definitions: R2 "Recovery ratio of the skin length"; R5 "Ratio of the elasticity part when stretched and during constriction"; R7 "Ratio of the immediate recovery and the top value"; R8 "Length of the recovered skin".
Significance in tables: only 6-mm Table 4 asterisks "* denotes p < 0.05": cheek R8 change CP5g (0.217 +/-0.163*); cheek F1 change CP5g (0.044 +/-0.035*, text calls it significant "worsening"); forearm R1 change CP1g (-0.076 +/-0.118*). Table 3 has no asterisks. Text: "in general, skin elasticity was not improved at 12 weeks".

TABLE 3 (2-mm probe)
R0: 0wk 0.345±0.064 | 0.373±0.057 | 0.370±0.050 || 0.347±0.063 | 0.348±0.046 | 0.357±0.048; 12wk 0.358±0.067 | 0.397±0.067 | 0.392±0.060 || 0.376±0.060 | 0.387±0.053 | 0.387±0.059; Change 0.013±0.039 | 0.024±0.041 | 0.022±0.037 || 0.028±0.044 | 0.039±0.046 | 0.030±0.044
R1: 0wk 0.069±0.019 | 0.071±0.023 | 0.070±0.017 || 0.040±0.013 | 0.037±0.011 | 0.042±0.011; 12wk 0.064±0.014 | 0.069±0.024 | 0.062±0.017 || 0.041±0.010 | 0.041±0.012 | 0.042±0.012; Change −0.004±0.013 | −0.002±0.025 | −0.008±0.016 || 0.001±0.010 | 0.003±0.013 | 0.000±0.011
R2: 0wk 0.796±0.061 | 0.809±0.053 | 0.808±0.05 || 0.885±0.033 | 0.893±0.026 | 0.882±0.033; 12wk 0.816±0.044 | 0.825±0.053 | 0.84±0.044 || 0.891±0.022 | 0.895±0.025 | 0.890±0.031; Change 0.020±0.032 | 0.016±0.054 | 0.032±0.036 || 0.005±0.025 | 0.002±0.028 | 0.008±0.029
R3: 0wk 0.450±0.060 | 0.481±0.061 | 0.475±0.055 || 0.438±0.063 | 0.442±0.043 | 0.449±0.051; 12wk 0.458±0.065 | 0.498±0.075 | 0.488±0.066 || 0.462±0.061 | 0.476±0.054 | 0.476±0.061; Change 0.009±0.038 | 0.017±0.042 | 0.012±0.038 || 0.024±0.043 | 0.034±0.043 | 0.027±0.048
R4: 0wk 0.202±0.034 | 0.212±0.052 | 0.212±0.033 || 0.121±0.033 | 0.118±0.036 | 0.126±0.028; 12wk 0.199±0.040 | 0.208±0.052 | 0.196±0.040 || 0.132±0.040 | 0.127±0.039 | 0.132±0.035; Change −0.003±0.035 | −0.004±0.042 | −0.017±0.034 || 0.011±0.034 | 0.009±0.034 | 0.006±0.029
R5: 0wk 0.561±0.086 | 0.564±0.093 | 0.574±0.072 || 0.834±0.105 | 0.857±0.082 | 0.825±0.069; 12wk 0.581±0.092 | 0.578±0.089 | 0.591±0.084 || 0.818±0.088 | 0.817±0.077 | 0.810±0.075; Change 0.020±0.067 | 0.015±0.086 | 0.017±0.076 || −0.016±0.083 | −0.040±0.068 | −0.014±0.060
R6: 0wk 0.333±0.078 | 0.309±0.079 | 0.304±0.058 || 0.334±0.082 | 0.322±0.061 | 0.321±0.043; 12wk 0.328±0.072 | 0.293±0.058 | 0.298±0.068 || 0.315±0.065 | 0.297±0.050 | 0.318±0.057; Change −0.006±0.059 | −0.016±0.079 | −0.006±0.052 || −0.019±0.068 | −0.026±0.06 | −0.003±0.054
R7: 0wk 0.422±0.068 | 0.430±0.066 | 0.441±0.060 || 0.624±0.057 | 0.648±0.051 | 0.625±0.058; 12wk 0.437±0.062 | 0.447±0.062 | 0.455±0.058 || 0.622±0.051 | 0.630±0.047 | 0.615±0.051; Change 0.015±0.044 | 0.017±0.052 | 0.014±0.048 || −0.002±0.037 | −0.018±0.034 | −0.010±0.040
R8: 0wk 0.276±0.063 | 0.301±0.050 | 0.300±0.052 || 0.308±0.057 | 0.311±0.041 | 0.315±0.047; 12wk 0.294±0.065 | 0.328±0.061 | 0.330±0.059 || 0.335±0.054 | 0.347±0.047 | 0.345±0.057; Change 0.018±0.034 | 0.026±0.036 | 0.030±0.031 || 0.027±0.040 | 0.036±0.040 | 0.029±0.041
R9: 0wk 0.105±0.013 | 0.108±0.016 | 0.106±0.016 || 0.09±0.016 | 0.093±0.012 | 0.092±0.011; 12wk 0.100±0.013 | 0.101±0.018 | 0.096±0.017 || 0.086±0.014 | 0.088±0.009 | 0.089±0.010; Change −0.004±0.013 | −0.007±0.013 | −0.01±0.012 || −0.004±0.014 | −0.005±0.011 | −0.003±0.011
F0: 0wk 17.856±2.436 | 18.963±2.729 | 18.805±2.102 || 15.228±2.395 | 15.225±1.959 | 15.713±1.766; 12wk 18.076±2.713 | 19.474±3.168 | 18.929±2.622 || 16.356±2.457 | 16.702±2.416 | 16.799±2.221; Change 0.219±1.707 | 0.511±1.999 | 0.124±1.822 || 1.129±1.821 | 1.477±1.943 | 1.086±1.848
F1: 0wk 0.036±0.007 | 0.038±0.007 | 0.037±0.006 || 0.030±0.007 | 0.029±0.005 | 0.030±0.005; 12wk 0.037±0.009 | 0.040±0.008 | 0.040±0.007 || 0.032±0.006 | 0.033±0.006 | 0.033±0.006; Change 0.001±0.006 | 0.002±0.005 | 0.002±0.005 || 0.002±0.006 | 0.005±0.004 | 0.003±0.005
F2: 0wk 1.910±0.279 | 1.963±0.317 | 1.905±0.319 || 1.629±0.332 | 1.684±0.263 | 1.649±0.222; 12wk 1.805±0.278 | 1.803±0.357 | 1.689±0.325 || 1.532±0.291 | 1.568±0.191 | 1.574±0.221; Change −0.105±0.262 | −0.160±0.264 | −0.216±0.243 || −0.097±0.258 | −0.116±0.226 | −0.075±0.218
F3: 0wk 16.216±3.499 | 17.640±3.205 | 17.438±3.122 || 19.508±3.467 | 19.784±2.166 | 19.885±3.08; 12wk 17.064±3.514 | 19.005±3.628 | 19.231±3.555 || 20.464±3.055 | 21.376±2.341 | 21.255±3.573; Change 0.847±1.834 | 1.365±2.496 | 1.793±1.715 || 0.956±2.165 | 1.593±1.948 | 1.370±2.436
F4: 0wk 25.096±3.692 | 26.909±3.569 | 26.642±3.175 || 24.649±3.773 | 24.800±2.642 | 25.297±2.993; 12wk 25.711±3.968 | 28.086±4.374 | 27.573±3.863 || 26.158±3.631 | 26.966±3.218 | 26.969±3.611; Change 0.615±2.302 | 1.177±2.481 | 0.931±2.234 || 1.510±2.633 | 2.166±2.643 | 1.672±2.790

TABLE 4 (6-mm probe)
R0: 0wk 0.985±0.200 | 1.103±0.211 | 1.053±0.182 || 1.303±0.182 | 1.345±0.180 | 1.324±0.215; 12wk 1.126±0.260 | 1.235±0.190 | 1.271±0.245 || 1.306±0.234 | 1.396±0.205 | 1.340±0.206; Change 0.141±0.172 | 0.132±0.136 | 0.218±0.180 || 0.003±0.184 | 0.052±0.195 | 0.015±0.172
R1: 0wk 0.249±0.083 | 0.270±0.096 | 0.269±0.090 || 0.239±0.102 | 0.248±0.134 | 0.257±0.123; 12wk 0.267±0.148 | 0.254±0.082 | 0.270±0.106 || 0.171±0.086 | 0.172±0.086 | 0.204±0.096; Change 0.018±0.128 | −0.016±0.093 | 0.001±0.086 || −0.067±0.100 | −0.076±0.118* | −0.054±0.108
R2: 0wk 0.752±0.051 | 0.758±0.059 | 0.747±0.060 || 0.821±0.061 | 0.821±0.090 | 0.809±0.076; 12wk 0.771±0.090 | 0.796±0.052 | 0.791±0.053 || 0.872±0.053 | 0.878±0.056 | 0.851±0.056; Change 0.019±0.084 | 0.038±0.063 | 0.044±0.062 || 0.051±0.067 | 0.057±0.087 | 0.042±0.069
R3: 0wk 1.209±0.209 | 1.327±0.208 | 1.276±0.184 || 1.473±0.191 | 1.516±0.170 | 1.494±0.205; 12wk 1.367±0.261 | 1.483±0.186 | 1.523±0.225 || 1.465±0.238 | 1.554±0.197 | 1.501±0.199; Change 0.159±0.175 | 0.156±0.129 | 0.246±0.181 || −0.008±0.171 | 0.039±0.188 | 0.007±0.172
R4: 0wk 0.573±0.148 | 0.599±0.133 | 0.601±0.146 || 0.434±0.160 | 0.425±0.181 | 0.478±0.181; 12wk 0.627±0.228 | 0.612±0.151 | 0.726±0.211 || 0.394±0.183 | 0.386±0.179 | 0.457±0.155; Change 0.055±0.165 | 0.013±0.132 | 0.125±0.143 || −0.041±0.172 | −0.039±0.148 | −0.021±0.143
R5: 0wk 0.357±0.099 | 0.343±0.056 | 0.322±0.059 || 0.460±0.083 | 0.482±0.099 | 0.412±0.096; 12wk 0.288±0.101 | 0.272±0.054 | 0.251±0.060 || 0.447±0.103 | 0.459±0.099 | 0.425±0.090; Change −0.068±0.067 | −0.071±0.057 | −0.071±0.059 || −0.013±0.072 | −0.023±0.071 | 0.013±0.072
R6: 0wk 0.284±0.079 | 0.251±0.064 | 0.270±0.046 || 0.389±0.077 | 0.391±0.091 | 0.397±0.107; 12wk 0.273±0.067 | 0.242±0.051 | 0.245±0.067 || 0.425±0.069 | 0.419±0.086 | 0.441±0.098; Change −0.010±0.071 | −0.009±0.052 | −0.025±0.055 || 0.036±0.078 | 0.028±0.085 | 0.044±0.088
R7: 0wk 0.276±0.065 | 0.274±0.039 | 0.252±0.043 || 0.331±0.059 | 0.345±0.058 | 0.294±0.060; 12wk 0.224±0.067 | 0.218±0.038 | 0.200±0.040 || 0.312±0.062 | 0.322±0.057 | 0.294±0.052; Change −0.052±0.042 | −0.056±0.039 | −0.052±0.040 || −0.019±0.039 | −0.023±0.035 | 0.000±0.040
R8: 0wk 0.735±0.141 | 0.833±0.164 | 0.784±0.138 || 1.064±0.128 | 1.097±0.155 | 1.067±0.176; 12wk 0.859±0.201 | 0.981±0.155 | 1.001±0.178 || 1.134±0.195 | 1.224±0.182 | 1.136±0.159; Change 0.123±0.140 | 0.148±0.101 | 0.217±0.163* || 0.070±0.150 | 0.127±0.223 | 0.069±0.148
R9: 0wk 0.224±0.042 | 0.224±0.031 | 0.223±0.038 || 0.170±0.040 | 0.171±0.046 | 0.170±0.061; 12wk 0.241±0.045 | 0.248±0.041 | 0.251±0.042 || 0.159±0.054 | 0.158±0.050 | 0.161±0.044; Change 0.017±0.037 | 0.024±0.047 | 0.028±0.049 || −0.010±0.060 | −0.013±0.064 | −0.008±0.070
F0: 0wk 50.223±10.228 | 54.787±9.683 | 53.318±9.095 || 56.231±9.300 | 57.398±9.199 | 58.497±10.356; 12wk 56.913±13.899 | 60.018±8.698 | 63.759±12.032 || 54.875±11.024 | 57.642±9.436 | 57.899±9.948; Change 6.690±9.552 | 5.230±7.288 | 10.440±8.950 || −1.356±8.760 | 0.243±7.718 | −0.598±8.544
F1: 0wk 0.114±0.028 | 0.126±0.027 | 0.122±0.025 || 0.139±0.027 | 0.137±0.022 | 0.143±0.027; 12wk 0.138±0.042 | 0.156±0.029 | 0.166±0.034 || 0.143±0.029 | 0.150±0.027 | 0.148±0.024; Change 0.024±0.029 | 0.030±0.030 | 0.044±0.035* || 0.004±0.019 | 0.013±0.027 | 0.006±0.023
F2: 0wk 3.877±0.866 | 3.902±0.630 | 3.867±0.724 || 2.764±0.870 | 2.762±0.996 | 2.703±1.189; 12wk 4.252±0.956 | 4.320±0.797 | 4.372±0.854 || 2.489±1.265 | 2.395±1.110 | 2.528±0.993; Change 0.375±0.758 | 0.417±0.872 | 0.505±0.929 || −0.275±1.298 | −0.366±1.404 | −0.176±1.289
F3: 0wk 41.716±7.108 | 47.273±8.422 | 44.307±7.323 || 64.055±8.875 | 66.906±9.702 | 62.782±9.786; 12wk 48.700±9.751 | 57.093±9.283 | 54.914±9.213 || 66.416±11.653 | 71.734±10.600 | 64.850±7.968; Change 6.984±6.664 | 9.820±4.957 | 10.607±7.932 || 2.361±9.291 | 4.827±13.135 | 2.068±8.579
F4: 0wk 68.621±12.419 | 75.692±12.548 | 72.721±11.014 || 85.720±11.384 | 88.252±10.351 | 87.021±12.359; 12wk 77.792±15.635 | 84.713±11.264 | 86.975±13.887 || 85.351±14.220 | 90.707±11.875 | 87.406±11.947; Change 9.171±10.421 | 9.022±7.746 | 14.254±10.787 || −0.369±10.378 | 2.455±11.275 | 0.385±10.255

(The "Change" values are as printed, and agree with 12wk minus 0wk to rounding, e.g. 3-table cheek R2 placebo 0.816-0.796 = 0.020.)

================================================================
CROSS-TRIAL FLAGS FOR THE META-ANALYSIS
================================================================
1. Hydration with usable numbers: Di Cerbo (figure only, endpoints, SEM), Asserin (figure only, endpoints, SEM, two collagen arms vs one shared placebo), Miyanaga (figure only for SC hydration: change from baseline, SD). Campos has NO hydration numbers at all.
2. Elasticity with usable numbers: Miyanaga (full Cutometer tables, SD, change from baseline and endpoints), Campos (R5 frontal only, figure only, endpoints, dispersion type unstated), Di Cerbo (Skin Tester elasticity, figure only, endpoints, SEM, labelled "no difference"). Asserin has none.
3. Dispersion types differ: Campos unclear; Di Cerbo SEM (stated in Methods); Asserin SEM (legend); Miyanaga SD (legend + table notes).
4. Not collagen-only: Campos (collagen + vitamins A/C/E + zinc, 10 g), Di Cerbo (124 mg collagen x2 daily inside a six-ingredient product incl. Pycnogenol); Asserin and Miyanaga are collagen-peptide-only.
5. Miyanaga SC hydration error bars: only caps are drawn, one direction per arm, and the two CP arms' caps cannot be assigned to arms (both readings given); triangle marker centre could be ~0.25 unit lower than reported. Asserin baseline markers overlapped (low confidence). Di Cerbo and Campos reads are clean (vector, unambiguous).
6. Asserin Study 1 has two collagen arms sharing one placebo of n=11; Miyanaga has two collagen doses sharing one placebo (n=33). Both need shared-control handling.

Files: PDFs at (scratch folder) ; extraction scripts and text dumps at .../scratchpad/b4out/ (mi.py = Miyanaga figure extractor, draw.py, Campos.txt, Di-raw.txt, As-raw.txt, Mi-raw.txt).
```
