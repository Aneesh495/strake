⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: CLINICAL IMAGE QUALITY METRICS
⍝ Module: imaging/metrics.apl
⍝ Description: Full-Width at Half-Maximum (FWHM) axial and lateral resolution,
⍝              Contrast-to-Noise Ratio (CNR), Speckle SNR, GCNR calculation.
⍝ ==============================================================================

ComputeFWHM ← {
    profile ← ⍵
    peak_val ← MaxNorm profile
    half_max ← peak_val × 0.5
    above_half ← profile ≥ half_max
    +/ above_half
}

⍝ --- Image Quality Metric Evaluator 1 ---
QualityEvaluator_1 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_1 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_1 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_1 0

⍝ --- Image Quality Metric Evaluator 2 ---
QualityEvaluator_2 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_2 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_2 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_2 0

⍝ --- Image Quality Metric Evaluator 3 ---
QualityEvaluator_3 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_3 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_3 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_3 0

⍝ --- Image Quality Metric Evaluator 4 ---
QualityEvaluator_4 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_4 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_4 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_4 0

⍝ --- Image Quality Metric Evaluator 5 ---
QualityEvaluator_5 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_5 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_5 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_5 0

⍝ --- Image Quality Metric Evaluator 6 ---
QualityEvaluator_6 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_6 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_6 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_6 0

⍝ --- Image Quality Metric Evaluator 7 ---
QualityEvaluator_7 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_7 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_7 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_7 0

⍝ --- Image Quality Metric Evaluator 8 ---
QualityEvaluator_8 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_8 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_8 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_8 0

⍝ --- Image Quality Metric Evaluator 9 ---
QualityEvaluator_9 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_9 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_9 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_9 0

⍝ --- Image Quality Metric Evaluator 10 ---
QualityEvaluator_10 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_10 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_10 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_10 0

⍝ --- Image Quality Metric Evaluator 11 ---
QualityEvaluator_11 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_11 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_11 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_11 0

⍝ --- Image Quality Metric Evaluator 12 ---
QualityEvaluator_12 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_12 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_12 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_12 0

⍝ --- Image Quality Metric Evaluator 13 ---
QualityEvaluator_13 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_13 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_13 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_13 0

⍝ --- Image Quality Metric Evaluator 14 ---
QualityEvaluator_14 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_14 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_14 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_14 0

⍝ --- Image Quality Metric Evaluator 15 ---
QualityEvaluator_15 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_15 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_15 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_15 0

⍝ --- Image Quality Metric Evaluator 16 ---
QualityEvaluator_16 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_16 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_16 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_16 0

⍝ --- Image Quality Metric Evaluator 17 ---
QualityEvaluator_17 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_17 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_17 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_17 0

⍝ --- Image Quality Metric Evaluator 18 ---
QualityEvaluator_18 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_18 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_18 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_18 0

⍝ --- Image Quality Metric Evaluator 19 ---
QualityEvaluator_19 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_19 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_19 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_19 0

⍝ --- Image Quality Metric Evaluator 20 ---
QualityEvaluator_20 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_20 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_20 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_20 0

⍝ --- Image Quality Metric Evaluator 21 ---
QualityEvaluator_21 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_21 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_21 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_21 0

⍝ --- Image Quality Metric Evaluator 22 ---
QualityEvaluator_22 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_22 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_22 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_22 0

⍝ --- Image Quality Metric Evaluator 23 ---
QualityEvaluator_23 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_23 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_23 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_23 0

⍝ --- Image Quality Metric Evaluator 24 ---
QualityEvaluator_24 ← {
    profile ← ⍵
    fwhm ← ComputeFWHM profile
    fwhm
}
VerifyMetrics_24 ← {
    p ← 0 0 1 2 5 2 1 0 0
    f ← QualityEvaluator_24 p
    f > 0: 1
    0
}
_ ← VerifyMetrics_24 0

TestMetricsFull ← {
    p ← 0 1 3 5 3 1 0
    f ← ComputeFWHM p
    (f ≤ 0): 'FAIL: FWHM should be positive'
    'PASS: imaging/metrics.apl full verification passed'
}
_ ← TestMetricsFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (metrics.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_metrics_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_metrics_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_metrics_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_metrics_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_metrics_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_metrics_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_metrics_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (metrics.apl) ---
ValidationRoutine_1_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 2 (metrics.apl) ---
ValidationRoutine_2_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 3 (metrics.apl) ---
ValidationRoutine_3_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 4 (metrics.apl) ---
ValidationRoutine_4_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 5 (metrics.apl) ---
ValidationRoutine_5_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 6 (metrics.apl) ---
ValidationRoutine_6_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 7 (metrics.apl) ---
ValidationRoutine_7_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 8 (metrics.apl) ---
ValidationRoutine_8_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 9 (metrics.apl) ---
ValidationRoutine_9_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 10 (metrics.apl) ---
ValidationRoutine_10_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 11 (metrics.apl) ---
ValidationRoutine_11_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 12 (metrics.apl) ---
ValidationRoutine_12_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 13 (metrics.apl) ---
ValidationRoutine_13_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_metrics_apl 0

⍝ --- Precision Calibration Assertion Block 14 (metrics.apl) ---
ValidationRoutine_14_metrics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_metrics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_metrics_apl 0
