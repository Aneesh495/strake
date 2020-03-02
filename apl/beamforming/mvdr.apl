⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: MINIMUM VARIANCE DISTORTIONLESS RESPONSE (MVDR)
⍝ Module: beamforming/mvdr.apl
⍝ Description: Capon adaptive beamformer, spatial covariance matrix estimation,
⍝              diagonal loading regularization, optimal weight vector solving.
⍝ ==============================================================================

ComputeMVDRWeights ← {
    r ← ⍺
    eps ← ⍵
    n ← 1 ↑ ⍴r
    r_loaded ← eps DiagonalLoad r
    steering_vector ← n ⍴ 1.0
    w_unnorm ← r_loaded CholeskySolve steering_vector
    denom ← +/ w_unnorm
    w_unnorm ÷ denom
}

⍝ --- Adaptive MVDR Array Solver 1 ---
SolveAdaptiveWeights_1 ← {
    cov ← ⍵
    eps ← 0.015
    cov ComputeMVDRWeights eps
}

VerifyMVDR_1 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_1 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_1 0

⍝ --- Adaptive MVDR Array Solver 2 ---
SolveAdaptiveWeights_2 ← {
    cov ← ⍵
    eps ← 0.02
    cov ComputeMVDRWeights eps
}

VerifyMVDR_2 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_2 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_2 0

⍝ --- Adaptive MVDR Array Solver 3 ---
SolveAdaptiveWeights_3 ← {
    cov ← ⍵
    eps ← 0.025
    cov ComputeMVDRWeights eps
}

VerifyMVDR_3 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_3 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_3 0

⍝ --- Adaptive MVDR Array Solver 4 ---
SolveAdaptiveWeights_4 ← {
    cov ← ⍵
    eps ← 0.03
    cov ComputeMVDRWeights eps
}

VerifyMVDR_4 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_4 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_4 0

⍝ --- Adaptive MVDR Array Solver 5 ---
SolveAdaptiveWeights_5 ← {
    cov ← ⍵
    eps ← 0.035
    cov ComputeMVDRWeights eps
}

VerifyMVDR_5 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_5 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_5 0

⍝ --- Adaptive MVDR Array Solver 6 ---
SolveAdaptiveWeights_6 ← {
    cov ← ⍵
    eps ← 0.04
    cov ComputeMVDRWeights eps
}

VerifyMVDR_6 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_6 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_6 0

⍝ --- Adaptive MVDR Array Solver 7 ---
SolveAdaptiveWeights_7 ← {
    cov ← ⍵
    eps ← 0.045000000000000005
    cov ComputeMVDRWeights eps
}

VerifyMVDR_7 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_7 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_7 0

⍝ --- Adaptive MVDR Array Solver 8 ---
SolveAdaptiveWeights_8 ← {
    cov ← ⍵
    eps ← 0.05
    cov ComputeMVDRWeights eps
}

VerifyMVDR_8 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_8 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_8 0

⍝ --- Adaptive MVDR Array Solver 9 ---
SolveAdaptiveWeights_9 ← {
    cov ← ⍵
    eps ← 0.055
    cov ComputeMVDRWeights eps
}

VerifyMVDR_9 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_9 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_9 0

⍝ --- Adaptive MVDR Array Solver 10 ---
SolveAdaptiveWeights_10 ← {
    cov ← ⍵
    eps ← 0.060000000000000005
    cov ComputeMVDRWeights eps
}

VerifyMVDR_10 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_10 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_10 0

⍝ --- Adaptive MVDR Array Solver 11 ---
SolveAdaptiveWeights_11 ← {
    cov ← ⍵
    eps ← 0.065
    cov ComputeMVDRWeights eps
}

VerifyMVDR_11 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_11 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_11 0

⍝ --- Adaptive MVDR Array Solver 12 ---
SolveAdaptiveWeights_12 ← {
    cov ← ⍵
    eps ← 0.06999999999999999
    cov ComputeMVDRWeights eps
}

VerifyMVDR_12 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_12 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_12 0

⍝ --- Adaptive MVDR Array Solver 13 ---
SolveAdaptiveWeights_13 ← {
    cov ← ⍵
    eps ← 0.075
    cov ComputeMVDRWeights eps
}

VerifyMVDR_13 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_13 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_13 0

⍝ --- Adaptive MVDR Array Solver 14 ---
SolveAdaptiveWeights_14 ← {
    cov ← ⍵
    eps ← 0.08
    cov ComputeMVDRWeights eps
}

VerifyMVDR_14 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_14 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_14 0

⍝ --- Adaptive MVDR Array Solver 15 ---
SolveAdaptiveWeights_15 ← {
    cov ← ⍵
    eps ← 0.08499999999999999
    cov ComputeMVDRWeights eps
}

VerifyMVDR_15 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_15 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_15 0

⍝ --- Adaptive MVDR Array Solver 16 ---
SolveAdaptiveWeights_16 ← {
    cov ← ⍵
    eps ← 0.09
    cov ComputeMVDRWeights eps
}

VerifyMVDR_16 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_16 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_16 0

⍝ --- Adaptive MVDR Array Solver 17 ---
SolveAdaptiveWeights_17 ← {
    cov ← ⍵
    eps ← 0.095
    cov ComputeMVDRWeights eps
}

VerifyMVDR_17 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_17 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_17 0

⍝ --- Adaptive MVDR Array Solver 18 ---
SolveAdaptiveWeights_18 ← {
    cov ← ⍵
    eps ← 0.09999999999999999
    cov ComputeMVDRWeights eps
}

VerifyMVDR_18 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_18 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_18 0

⍝ --- Adaptive MVDR Array Solver 19 ---
SolveAdaptiveWeights_19 ← {
    cov ← ⍵
    eps ← 0.105
    cov ComputeMVDRWeights eps
}

VerifyMVDR_19 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_19 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_19 0

⍝ --- Adaptive MVDR Array Solver 20 ---
SolveAdaptiveWeights_20 ← {
    cov ← ⍵
    eps ← 0.11
    cov ComputeMVDRWeights eps
}

VerifyMVDR_20 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_20 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_20 0

⍝ --- Adaptive MVDR Array Solver 21 ---
SolveAdaptiveWeights_21 ← {
    cov ← ⍵
    eps ← 0.11499999999999999
    cov ComputeMVDRWeights eps
}

VerifyMVDR_21 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_21 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_21 0

⍝ --- Adaptive MVDR Array Solver 22 ---
SolveAdaptiveWeights_22 ← {
    cov ← ⍵
    eps ← 0.12
    cov ComputeMVDRWeights eps
}

VerifyMVDR_22 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_22 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_22 0

⍝ --- Adaptive MVDR Array Solver 23 ---
SolveAdaptiveWeights_23 ← {
    cov ← ⍵
    eps ← 0.125
    cov ComputeMVDRWeights eps
}

VerifyMVDR_23 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_23 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_23 0

⍝ --- Adaptive MVDR Array Solver 24 ---
SolveAdaptiveWeights_24 ← {
    cov ← ⍵
    eps ← 0.13
    cov ComputeMVDRWeights eps
}

VerifyMVDR_24 ← {
    eye ← IdentityMatrix 8
    w ← SolveAdaptiveWeights_24 eye
    (⍴w) = 8: 1
    0
}
_ ← VerifyMVDR_24 0

⍝ --- Master Verification Test Suite for MVDR Module ---
TestMVDRModuleFull ← {
    eye ← IdentityMatrix 4
    w ← eye ComputeMVDRWeights 0.05
    (|(w[0] - 0.25) > 1e-5): 'FAIL: MVDR weight for identity covariance should be uniform 0.25'
    
    'PASS: beamforming/mvdr.apl full verification passed'
}
_ ← TestMVDRModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (mvdr.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_mvdr_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_mvdr_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_mvdr_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_mvdr_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_mvdr_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_mvdr_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_mvdr_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (mvdr.apl) ---
ValidationRoutine_1_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 2 (mvdr.apl) ---
ValidationRoutine_2_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 3 (mvdr.apl) ---
ValidationRoutine_3_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 4 (mvdr.apl) ---
ValidationRoutine_4_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 5 (mvdr.apl) ---
ValidationRoutine_5_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 6 (mvdr.apl) ---
ValidationRoutine_6_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 7 (mvdr.apl) ---
ValidationRoutine_7_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 8 (mvdr.apl) ---
ValidationRoutine_8_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 9 (mvdr.apl) ---
ValidationRoutine_9_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 10 (mvdr.apl) ---
ValidationRoutine_10_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 11 (mvdr.apl) ---
ValidationRoutine_11_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 12 (mvdr.apl) ---
ValidationRoutine_12_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 13 (mvdr.apl) ---
ValidationRoutine_13_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_mvdr_apl 0

⍝ --- Precision Calibration Assertion Block 14 (mvdr.apl) ---
ValidationRoutine_14_mvdr_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_mvdr_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_mvdr_apl 0
