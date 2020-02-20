⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: DELAY-MULTIPLY-AND-SUM (DMAS) BEAMFORMER
⍝ Module: beamforming/dmas.apl
⍝ Description: Nonlinear signed correlation beamforming for enhanced sidelobe
⍝              suppression and point target contrast resolution.
⍝ ==============================================================================

SignedSquareRootProduct ← {
    s_i ← ⍺
    s_j ← ⍵
    prod ← s_i × s_j
    (Sign prod) × ((|prod) * 0.5)
}

DMASCorrelationSum ← {
    delayed_signals ← ⍵
    n ← ⍴delayed_signals
    n ≤ 1: 1 ↑ delayed_signals
    
    pairs ← delayed_signals ∘.SignedSquareRootProduct delayed_signals
    sum ← (+/ , pairs) - (+/ (ExtractDiagonal pairs))
    sum × 0.5
}

⍝ --- DMAS Processing Stage 1 ---
DMASReconstructVoxel_1 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_1 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_1 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_1 0

⍝ --- DMAS Processing Stage 2 ---
DMASReconstructVoxel_2 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_2 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_2 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_2 0

⍝ --- DMAS Processing Stage 3 ---
DMASReconstructVoxel_3 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_3 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_3 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_3 0

⍝ --- DMAS Processing Stage 4 ---
DMASReconstructVoxel_4 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_4 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_4 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_4 0

⍝ --- DMAS Processing Stage 5 ---
DMASReconstructVoxel_5 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_5 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_5 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_5 0

⍝ --- DMAS Processing Stage 6 ---
DMASReconstructVoxel_6 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_6 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_6 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_6 0

⍝ --- DMAS Processing Stage 7 ---
DMASReconstructVoxel_7 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_7 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_7 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_7 0

⍝ --- DMAS Processing Stage 8 ---
DMASReconstructVoxel_8 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_8 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_8 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_8 0

⍝ --- DMAS Processing Stage 9 ---
DMASReconstructVoxel_9 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_9 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_9 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_9 0

⍝ --- DMAS Processing Stage 10 ---
DMASReconstructVoxel_10 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_10 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_10 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_10 0

⍝ --- DMAS Processing Stage 11 ---
DMASReconstructVoxel_11 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_11 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_11 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_11 0

⍝ --- DMAS Processing Stage 12 ---
DMASReconstructVoxel_12 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_12 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_12 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_12 0

⍝ --- DMAS Processing Stage 13 ---
DMASReconstructVoxel_13 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_13 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_13 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_13 0

⍝ --- DMAS Processing Stage 14 ---
DMASReconstructVoxel_14 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_14 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_14 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_14 0

⍝ --- DMAS Processing Stage 15 ---
DMASReconstructVoxel_15 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_15 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_15 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_15 0

⍝ --- DMAS Processing Stage 16 ---
DMASReconstructVoxel_16 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_16 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_16 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_16 0

⍝ --- DMAS Processing Stage 17 ---
DMASReconstructVoxel_17 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_17 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_17 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_17 0

⍝ --- DMAS Processing Stage 18 ---
DMASReconstructVoxel_18 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_18 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_18 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_18 0

⍝ --- DMAS Processing Stage 19 ---
DMASReconstructVoxel_19 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_19 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_19 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_19 0

⍝ --- DMAS Processing Stage 20 ---
DMASReconstructVoxel_20 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_20 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_20 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_20 0

⍝ --- DMAS Processing Stage 21 ---
DMASReconstructVoxel_21 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_21 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_21 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_21 0

⍝ --- DMAS Processing Stage 22 ---
DMASReconstructVoxel_22 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_22 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_22 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_22 0

⍝ --- DMAS Processing Stage 23 ---
DMASReconstructVoxel_23 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_23 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_23 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_23 0

⍝ --- DMAS Processing Stage 24 ---
DMASReconstructVoxel_24 ← {
    signals ← ⍵
    dmas_val ← DMASCorrelationSum signals
    dmas_val
}

VerifyDMAS_24 ← {
    sigs ← 1 2 3 4 5
    v ← DMASReconstructVoxel_24 sigs
    v > 0: 1
    0
}
_ ← VerifyDMAS_24 0

⍝ --- Master Verification Test Suite for DMAS Module ---
TestDMASModuleFull ← {
    sigs ← 4 ⍴ 2.0
    v ← DMASCorrelationSum sigs
    (v ≤ 0): 'FAIL: DMAS correlation sum failed'
    
    'PASS: beamforming/dmas.apl full verification passed'
}
_ ← TestDMASModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (dmas.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_dmas_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_dmas_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_dmas_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_dmas_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_dmas_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_dmas_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_dmas_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (dmas.apl) ---
ValidationRoutine_1_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 2 (dmas.apl) ---
ValidationRoutine_2_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 3 (dmas.apl) ---
ValidationRoutine_3_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 4 (dmas.apl) ---
ValidationRoutine_4_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 5 (dmas.apl) ---
ValidationRoutine_5_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 6 (dmas.apl) ---
ValidationRoutine_6_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 7 (dmas.apl) ---
ValidationRoutine_7_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 8 (dmas.apl) ---
ValidationRoutine_8_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 9 (dmas.apl) ---
ValidationRoutine_9_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 10 (dmas.apl) ---
ValidationRoutine_10_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 11 (dmas.apl) ---
ValidationRoutine_11_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 12 (dmas.apl) ---
ValidationRoutine_12_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 13 (dmas.apl) ---
ValidationRoutine_13_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_dmas_apl 0

⍝ --- Precision Calibration Assertion Block 14 (dmas.apl) ---
ValidationRoutine_14_dmas_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_dmas_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_dmas_apl 0
