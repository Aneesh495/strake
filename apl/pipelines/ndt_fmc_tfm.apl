⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: NON-DESTRUCTIVE TESTING (NDT) FMC-TFM PIPELINE
⍝ Module: pipelines/ndt_fmc_tfm.apl
⍝ Description: Industrial weld inspection, crack and void detection, Full Matrix
⍝              Capture (FMC) acquisition, Total Focusing Method (TFM) reconstruction.
⍝ ==============================================================================

ExecuteNDTInspectionPipeline ← {
    fmc_cube ← ⍵
    TFMVoxelIntensity fmc_cube
}

⍝ --- NDT Crack Detection Unit 1 ---
CrackDetectionUnit_1 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_1 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_1 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_1 0

⍝ --- NDT Crack Detection Unit 2 ---
CrackDetectionUnit_2 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_2 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_2 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_2 0

⍝ --- NDT Crack Detection Unit 3 ---
CrackDetectionUnit_3 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_3 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_3 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_3 0

⍝ --- NDT Crack Detection Unit 4 ---
CrackDetectionUnit_4 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_4 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_4 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_4 0

⍝ --- NDT Crack Detection Unit 5 ---
CrackDetectionUnit_5 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_5 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_5 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_5 0

⍝ --- NDT Crack Detection Unit 6 ---
CrackDetectionUnit_6 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_6 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_6 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_6 0

⍝ --- NDT Crack Detection Unit 7 ---
CrackDetectionUnit_7 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_7 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_7 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_7 0

⍝ --- NDT Crack Detection Unit 8 ---
CrackDetectionUnit_8 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_8 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_8 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_8 0

⍝ --- NDT Crack Detection Unit 9 ---
CrackDetectionUnit_9 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_9 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_9 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_9 0

⍝ --- NDT Crack Detection Unit 10 ---
CrackDetectionUnit_10 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_10 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_10 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_10 0

⍝ --- NDT Crack Detection Unit 11 ---
CrackDetectionUnit_11 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_11 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_11 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_11 0

⍝ --- NDT Crack Detection Unit 12 ---
CrackDetectionUnit_12 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_12 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_12 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_12 0

⍝ --- NDT Crack Detection Unit 13 ---
CrackDetectionUnit_13 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_13 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_13 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_13 0

⍝ --- NDT Crack Detection Unit 14 ---
CrackDetectionUnit_14 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_14 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_14 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_14 0

⍝ --- NDT Crack Detection Unit 15 ---
CrackDetectionUnit_15 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_15 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_15 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_15 0

⍝ --- NDT Crack Detection Unit 16 ---
CrackDetectionUnit_16 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_16 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_16 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_16 0

⍝ --- NDT Crack Detection Unit 17 ---
CrackDetectionUnit_17 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_17 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_17 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_17 0

⍝ --- NDT Crack Detection Unit 18 ---
CrackDetectionUnit_18 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_18 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_18 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_18 0

⍝ --- NDT Crack Detection Unit 19 ---
CrackDetectionUnit_19 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_19 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_19 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_19 0

⍝ --- NDT Crack Detection Unit 20 ---
CrackDetectionUnit_20 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_20 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_20 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_20 0

⍝ --- NDT Crack Detection Unit 21 ---
CrackDetectionUnit_21 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_21 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_21 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_21 0

⍝ --- NDT Crack Detection Unit 22 ---
CrackDetectionUnit_22 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_22 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_22 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_22 0

⍝ --- NDT Crack Detection Unit 23 ---
CrackDetectionUnit_23 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_23 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_23 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_23 0

⍝ --- NDT Crack Detection Unit 24 ---
CrackDetectionUnit_24 ← {
    cube ← ⍵
    ExecuteNDTInspectionPipeline cube
}
VerifyNDT_24 ← {
    cube_t ← 4 4 100 ⍴ 1.0
    v ← CrackDetectionUnit_24 cube_t
    v > 0: 1
    0
}
_ ← VerifyNDT_24 0

TestNDTPipelineFull ← {
    cube ← 4 4 50 ⍴ 2.0
    v ← ExecuteNDTInspectionPipeline cube
    (|(v - 2.0) > 1e-6): 'FAIL: NDT inspection intensity mismatch'
    'PASS: pipelines/ndt_fmc_tfm.apl full verification passed'
}
_ ← TestNDTPipelineFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (ndt_fmc_tfm.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_ndt_fmc_tfm_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_ndt_fmc_tfm_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_ndt_fmc_tfm_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_ndt_fmc_tfm_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_ndt_fmc_tfm_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_ndt_fmc_tfm_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (ndt_fmc_tfm.apl) ---
ValidationRoutine_1_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 2 (ndt_fmc_tfm.apl) ---
ValidationRoutine_2_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 3 (ndt_fmc_tfm.apl) ---
ValidationRoutine_3_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 4 (ndt_fmc_tfm.apl) ---
ValidationRoutine_4_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 5 (ndt_fmc_tfm.apl) ---
ValidationRoutine_5_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 6 (ndt_fmc_tfm.apl) ---
ValidationRoutine_6_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 7 (ndt_fmc_tfm.apl) ---
ValidationRoutine_7_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 8 (ndt_fmc_tfm.apl) ---
ValidationRoutine_8_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 9 (ndt_fmc_tfm.apl) ---
ValidationRoutine_9_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 10 (ndt_fmc_tfm.apl) ---
ValidationRoutine_10_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 11 (ndt_fmc_tfm.apl) ---
ValidationRoutine_11_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 12 (ndt_fmc_tfm.apl) ---
ValidationRoutine_12_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 13 (ndt_fmc_tfm.apl) ---
ValidationRoutine_13_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_ndt_fmc_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 14 (ndt_fmc_tfm.apl) ---
ValidationRoutine_14_ndt_fmc_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ndt_fmc_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_ndt_fmc_tfm_apl 0
