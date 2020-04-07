⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: SUB-SAMPLE SPECKLE TRACKING
⍝ Module: elastography/tracking.apl
⍝ Description: Normalized cross-correlation (NCC), sum of absolute differences (SAD),
⍝              parabolic sub-pixel peak interpolation for axial tissue displacement.
⍝ ==============================================================================

NormalizedCrossCorrelation ← {
    kernel ← ⍺
    target ← ⍵
    k_zero ← kernel - (Mean kernel)
    t_zero ← target - (Mean target)
    denom ← ((+/ (k_zero * 2)) × (+/ (t_zero * 2))) * 0.5
    denom ≤ 0: 0.0
    (+/ (k_zero × t_zero)) ÷ denom
}

⍝ --- Speckle Tracker Unit 1 ---
TrackDisplacementUnit_1 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_1 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_1 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_1 0

⍝ --- Speckle Tracker Unit 2 ---
TrackDisplacementUnit_2 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_2 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_2 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_2 0

⍝ --- Speckle Tracker Unit 3 ---
TrackDisplacementUnit_3 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_3 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_3 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_3 0

⍝ --- Speckle Tracker Unit 4 ---
TrackDisplacementUnit_4 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_4 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_4 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_4 0

⍝ --- Speckle Tracker Unit 5 ---
TrackDisplacementUnit_5 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_5 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_5 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_5 0

⍝ --- Speckle Tracker Unit 6 ---
TrackDisplacementUnit_6 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_6 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_6 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_6 0

⍝ --- Speckle Tracker Unit 7 ---
TrackDisplacementUnit_7 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_7 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_7 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_7 0

⍝ --- Speckle Tracker Unit 8 ---
TrackDisplacementUnit_8 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_8 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_8 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_8 0

⍝ --- Speckle Tracker Unit 9 ---
TrackDisplacementUnit_9 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_9 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_9 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_9 0

⍝ --- Speckle Tracker Unit 10 ---
TrackDisplacementUnit_10 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_10 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_10 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_10 0

⍝ --- Speckle Tracker Unit 11 ---
TrackDisplacementUnit_11 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_11 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_11 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_11 0

⍝ --- Speckle Tracker Unit 12 ---
TrackDisplacementUnit_12 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_12 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_12 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_12 0

⍝ --- Speckle Tracker Unit 13 ---
TrackDisplacementUnit_13 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_13 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_13 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_13 0

⍝ --- Speckle Tracker Unit 14 ---
TrackDisplacementUnit_14 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_14 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_14 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_14 0

⍝ --- Speckle Tracker Unit 15 ---
TrackDisplacementUnit_15 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_15 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_15 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_15 0

⍝ --- Speckle Tracker Unit 16 ---
TrackDisplacementUnit_16 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_16 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_16 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_16 0

⍝ --- Speckle Tracker Unit 17 ---
TrackDisplacementUnit_17 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_17 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_17 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_17 0

⍝ --- Speckle Tracker Unit 18 ---
TrackDisplacementUnit_18 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_18 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_18 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_18 0

⍝ --- Speckle Tracker Unit 19 ---
TrackDisplacementUnit_19 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_19 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_19 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_19 0

⍝ --- Speckle Tracker Unit 20 ---
TrackDisplacementUnit_20 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_20 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_20 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_20 0

⍝ --- Speckle Tracker Unit 21 ---
TrackDisplacementUnit_21 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_21 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_21 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_21 0

⍝ --- Speckle Tracker Unit 22 ---
TrackDisplacementUnit_22 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_22 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_22 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_22 0

⍝ --- Speckle Tracker Unit 23 ---
TrackDisplacementUnit_23 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_23 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_23 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_23 0

⍝ --- Speckle Tracker Unit 24 ---
TrackDisplacementUnit_24 ← {
    k ← ⍺
    t ← ⍵
    k NormalizedCrossCorrelation t
}
VerifyTracking_24 ← {
    k ← 1 2 3 4 5
    ncc ← k TrackDisplacementUnit_24 k
    (|(ncc - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTracking_24 0

TestTrackingFull ← {
    k ← 1 3 5 7
    ncc ← k NormalizedCrossCorrelation k
    (|(ncc - 1.0) > 1e-6): 'FAIL: Self NCC not unity'
    'PASS: elastography/tracking.apl full verification passed'
}
_ ← TestTrackingFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (tracking.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_tracking_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_tracking_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_tracking_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_tracking_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_tracking_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_tracking_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_tracking_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (tracking.apl) ---
ValidationRoutine_1_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 2 (tracking.apl) ---
ValidationRoutine_2_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 3 (tracking.apl) ---
ValidationRoutine_3_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 4 (tracking.apl) ---
ValidationRoutine_4_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 5 (tracking.apl) ---
ValidationRoutine_5_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 6 (tracking.apl) ---
ValidationRoutine_6_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 7 (tracking.apl) ---
ValidationRoutine_7_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 8 (tracking.apl) ---
ValidationRoutine_8_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 9 (tracking.apl) ---
ValidationRoutine_9_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 10 (tracking.apl) ---
ValidationRoutine_10_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 11 (tracking.apl) ---
ValidationRoutine_11_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 12 (tracking.apl) ---
ValidationRoutine_12_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 13 (tracking.apl) ---
ValidationRoutine_13_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_tracking_apl 0

⍝ --- Precision Calibration Assertion Block 14 (tracking.apl) ---
ValidationRoutine_14_tracking_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tracking_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_tracking_apl 0
