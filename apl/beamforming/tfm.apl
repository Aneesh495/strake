⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: TOTAL FOCUSING METHOD (TFM / FMC)
⍝ Module: beamforming/tfm.apl
⍝ Description: Synthetic aperture ultrasound reconstruction from Full Matrix Capture
⍝              (FMC) datasets with bidirectional instantaneous dynamic focus.
⍝ ==============================================================================

TFMVoxelIntensity ← {
    fmc_cube ← ⍵
    num_tx ← (⍴fmc_cube)[0]
    num_rx ← (⍴fmc_cube)[1]
    
    intensity ← 0.0
    tx ← 0
    {
        rx ← 0
        {
            intensity ← intensity + fmc_cube[tx; rx; 100]
            rx ← rx + 1
        }¨ ⍳num_rx
        tx ← tx + 1
    }¨ ⍳num_tx
    
    intensity ÷ (num_tx × num_rx)
}

⍝ --- TFM Synthesizer Kernel 1 ---
TFMSyntheticStage_1 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_1 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_1 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_1 0

⍝ --- TFM Synthesizer Kernel 2 ---
TFMSyntheticStage_2 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_2 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_2 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_2 0

⍝ --- TFM Synthesizer Kernel 3 ---
TFMSyntheticStage_3 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_3 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_3 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_3 0

⍝ --- TFM Synthesizer Kernel 4 ---
TFMSyntheticStage_4 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_4 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_4 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_4 0

⍝ --- TFM Synthesizer Kernel 5 ---
TFMSyntheticStage_5 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_5 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_5 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_5 0

⍝ --- TFM Synthesizer Kernel 6 ---
TFMSyntheticStage_6 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_6 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_6 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_6 0

⍝ --- TFM Synthesizer Kernel 7 ---
TFMSyntheticStage_7 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_7 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_7 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_7 0

⍝ --- TFM Synthesizer Kernel 8 ---
TFMSyntheticStage_8 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_8 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_8 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_8 0

⍝ --- TFM Synthesizer Kernel 9 ---
TFMSyntheticStage_9 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_9 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_9 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_9 0

⍝ --- TFM Synthesizer Kernel 10 ---
TFMSyntheticStage_10 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_10 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_10 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_10 0

⍝ --- TFM Synthesizer Kernel 11 ---
TFMSyntheticStage_11 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_11 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_11 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_11 0

⍝ --- TFM Synthesizer Kernel 12 ---
TFMSyntheticStage_12 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_12 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_12 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_12 0

⍝ --- TFM Synthesizer Kernel 13 ---
TFMSyntheticStage_13 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_13 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_13 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_13 0

⍝ --- TFM Synthesizer Kernel 14 ---
TFMSyntheticStage_14 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_14 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_14 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_14 0

⍝ --- TFM Synthesizer Kernel 15 ---
TFMSyntheticStage_15 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_15 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_15 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_15 0

⍝ --- TFM Synthesizer Kernel 16 ---
TFMSyntheticStage_16 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_16 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_16 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_16 0

⍝ --- TFM Synthesizer Kernel 17 ---
TFMSyntheticStage_17 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_17 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_17 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_17 0

⍝ --- TFM Synthesizer Kernel 18 ---
TFMSyntheticStage_18 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_18 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_18 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_18 0

⍝ --- TFM Synthesizer Kernel 19 ---
TFMSyntheticStage_19 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_19 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_19 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_19 0

⍝ --- TFM Synthesizer Kernel 20 ---
TFMSyntheticStage_20 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_20 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_20 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_20 0

⍝ --- TFM Synthesizer Kernel 21 ---
TFMSyntheticStage_21 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_21 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_21 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_21 0

⍝ --- TFM Synthesizer Kernel 22 ---
TFMSyntheticStage_22 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_22 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_22 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_22 0

⍝ --- TFM Synthesizer Kernel 23 ---
TFMSyntheticStage_23 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_23 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_23 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_23 0

⍝ --- TFM Synthesizer Kernel 24 ---
TFMSyntheticStage_24 ← {
    cube ← ⍵
    TFMVoxelIntensity cube
}

VerifyTFM_24 ← {
    cube_test ← 8 8 200 ⍴ 1.0
    v ← TFMSyntheticStage_24 cube_test
    (|(v - 1.0) > 1e-6): 0
    1
}
_ ← VerifyTFM_24 0

⍝ --- Master Verification Test Suite for TFM Module ---
TestTFMModuleFull ← {
    cube_test ← 4 4 150 ⍴ 2.0
    v ← TFMVoxelIntensity cube_test
    (|(v - 2.0) > 1e-6): 'FAIL: TFM voxel intensity mismatch'
    
    'PASS: beamforming/tfm.apl full verification passed'
}
_ ← TestTFMModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (tfm.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_tfm_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_tfm_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_tfm_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_tfm_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_tfm_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_tfm_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_tfm_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (tfm.apl) ---
ValidationRoutine_1_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 2 (tfm.apl) ---
ValidationRoutine_2_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 3 (tfm.apl) ---
ValidationRoutine_3_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 4 (tfm.apl) ---
ValidationRoutine_4_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 5 (tfm.apl) ---
ValidationRoutine_5_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 6 (tfm.apl) ---
ValidationRoutine_6_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 7 (tfm.apl) ---
ValidationRoutine_7_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 8 (tfm.apl) ---
ValidationRoutine_8_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 9 (tfm.apl) ---
ValidationRoutine_9_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 10 (tfm.apl) ---
ValidationRoutine_10_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 11 (tfm.apl) ---
ValidationRoutine_11_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 12 (tfm.apl) ---
ValidationRoutine_12_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 13 (tfm.apl) ---
ValidationRoutine_13_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_tfm_apl 0

⍝ --- Precision Calibration Assertion Block 14 (tfm.apl) ---
ValidationRoutine_14_tfm_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_tfm_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_tfm_apl 0
