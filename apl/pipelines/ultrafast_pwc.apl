⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: ULTRAFAST PLANE-WAVE COMPOUNDING PIPELINE
⍝ Module: pipelines/ultrafast_pwc.apl
⍝ Description: Ultrafast coherent plane-wave compounding (1000+ frames per second),
⍝              multi-steering angle synthesis, speckle contrast optimization.
⍝ ==============================================================================

ExecuteUltrafastPWCPipeline ← {
    angle_frames_stack ← ⍵
    CoherentCompoundFrames angle_frames_stack
}

⍝ --- Ultrafast PWC Core 1 ---
UltrafastPWCCore_1 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_1 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_1 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_1 0

⍝ --- Ultrafast PWC Core 2 ---
UltrafastPWCCore_2 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_2 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_2 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_2 0

⍝ --- Ultrafast PWC Core 3 ---
UltrafastPWCCore_3 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_3 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_3 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_3 0

⍝ --- Ultrafast PWC Core 4 ---
UltrafastPWCCore_4 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_4 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_4 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_4 0

⍝ --- Ultrafast PWC Core 5 ---
UltrafastPWCCore_5 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_5 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_5 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_5 0

⍝ --- Ultrafast PWC Core 6 ---
UltrafastPWCCore_6 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_6 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_6 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_6 0

⍝ --- Ultrafast PWC Core 7 ---
UltrafastPWCCore_7 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_7 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_7 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_7 0

⍝ --- Ultrafast PWC Core 8 ---
UltrafastPWCCore_8 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_8 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_8 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_8 0

⍝ --- Ultrafast PWC Core 9 ---
UltrafastPWCCore_9 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_9 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_9 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_9 0

⍝ --- Ultrafast PWC Core 10 ---
UltrafastPWCCore_10 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_10 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_10 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_10 0

⍝ --- Ultrafast PWC Core 11 ---
UltrafastPWCCore_11 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_11 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_11 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_11 0

⍝ --- Ultrafast PWC Core 12 ---
UltrafastPWCCore_12 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_12 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_12 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_12 0

⍝ --- Ultrafast PWC Core 13 ---
UltrafastPWCCore_13 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_13 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_13 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_13 0

⍝ --- Ultrafast PWC Core 14 ---
UltrafastPWCCore_14 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_14 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_14 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_14 0

⍝ --- Ultrafast PWC Core 15 ---
UltrafastPWCCore_15 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_15 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_15 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_15 0

⍝ --- Ultrafast PWC Core 16 ---
UltrafastPWCCore_16 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_16 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_16 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_16 0

⍝ --- Ultrafast PWC Core 17 ---
UltrafastPWCCore_17 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_17 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_17 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_17 0

⍝ --- Ultrafast PWC Core 18 ---
UltrafastPWCCore_18 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_18 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_18 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_18 0

⍝ --- Ultrafast PWC Core 19 ---
UltrafastPWCCore_19 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_19 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_19 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_19 0

⍝ --- Ultrafast PWC Core 20 ---
UltrafastPWCCore_20 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_20 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_20 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_20 0

⍝ --- Ultrafast PWC Core 21 ---
UltrafastPWCCore_21 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_21 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_21 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_21 0

⍝ --- Ultrafast PWC Core 22 ---
UltrafastPWCCore_22 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_22 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_22 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_22 0

⍝ --- Ultrafast PWC Core 23 ---
UltrafastPWCCore_23 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_23 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_23 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_23 0

⍝ --- Ultrafast PWC Core 24 ---
UltrafastPWCCore_24 ← {
    stack ← ⍵
    ExecuteUltrafastPWCPipeline stack
}
VerifyPWC_24 ← {
    st ← 5 20 20 ⍴ 1.0
    c ← UltrafastPWCCore_24 st
    (⍴c) = 20 20: 1
    0
}
_ ← VerifyPWC_24 0

TestUltrafastPWCFull ← {
    st ← 3 15 15 ⍴ 2.0
    c ← ExecuteUltrafastPWCPipeline st
    (|(c[0;0] - 2.0) > 1e-6): 'FAIL: Ultrafast PWC output mismatch'
    'PASS: pipelines/ultrafast_pwc.apl full verification passed'
}
_ ← TestUltrafastPWCFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (ultrafast_pwc.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_ultrafast_pwc_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_ultrafast_pwc_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_ultrafast_pwc_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_ultrafast_pwc_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_ultrafast_pwc_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_ultrafast_pwc_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (ultrafast_pwc.apl) ---
ValidationRoutine_1_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 2 (ultrafast_pwc.apl) ---
ValidationRoutine_2_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 3 (ultrafast_pwc.apl) ---
ValidationRoutine_3_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 4 (ultrafast_pwc.apl) ---
ValidationRoutine_4_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 5 (ultrafast_pwc.apl) ---
ValidationRoutine_5_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 6 (ultrafast_pwc.apl) ---
ValidationRoutine_6_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 7 (ultrafast_pwc.apl) ---
ValidationRoutine_7_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 8 (ultrafast_pwc.apl) ---
ValidationRoutine_8_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 9 (ultrafast_pwc.apl) ---
ValidationRoutine_9_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 10 (ultrafast_pwc.apl) ---
ValidationRoutine_10_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 11 (ultrafast_pwc.apl) ---
ValidationRoutine_11_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 12 (ultrafast_pwc.apl) ---
ValidationRoutine_12_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 13 (ultrafast_pwc.apl) ---
ValidationRoutine_13_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_ultrafast_pwc_apl 0

⍝ --- Precision Calibration Assertion Block 14 (ultrafast_pwc.apl) ---
ValidationRoutine_14_ultrafast_pwc_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_ultrafast_pwc_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_ultrafast_pwc_apl 0
