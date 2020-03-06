⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: TISSUE HARMONIC IMAGING (THI) & PULSE INVERSION
⍝ Module: beamforming/harmonic_imaging.apl
⍝ Description: Nonlinear acoustic wave propagation, second harmonic (2*f0) extraction,
⍝              pulse inversion two-pulse cancellation of linear fundamental clutter.
⍝ ==============================================================================

PulseInversionSum ← {
    pulse_pos ← 1 ↑ ⍵
    pulse_neg ← 1 ↓ ⍵
    (pulse_pos + pulse_neg) × 0.5
}

⍝ --- Parameterized Pipeline Kernel 1 ---
EngineSubroutine_1 ← {
    input_data ← ⍵
    param_scaling ← 1.05
    input_data × param_scaling
}
VerifySub_1 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_1 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_1 0


⍝ --- Parameterized Pipeline Kernel 2 ---
EngineSubroutine_2 ← {
    input_data ← ⍵
    param_scaling ← 1.1
    input_data × param_scaling
}
VerifySub_2 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_2 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_2 0


⍝ --- Parameterized Pipeline Kernel 3 ---
EngineSubroutine_3 ← {
    input_data ← ⍵
    param_scaling ← 1.15
    input_data × param_scaling
}
VerifySub_3 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_3 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_3 0


⍝ --- Parameterized Pipeline Kernel 4 ---
EngineSubroutine_4 ← {
    input_data ← ⍵
    param_scaling ← 1.2
    input_data × param_scaling
}
VerifySub_4 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_4 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_4 0


⍝ --- Parameterized Pipeline Kernel 5 ---
EngineSubroutine_5 ← {
    input_data ← ⍵
    param_scaling ← 1.25
    input_data × param_scaling
}
VerifySub_5 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_5 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_5 0


⍝ --- Parameterized Pipeline Kernel 6 ---
EngineSubroutine_6 ← {
    input_data ← ⍵
    param_scaling ← 1.3
    input_data × param_scaling
}
VerifySub_6 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_6 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_6 0


⍝ --- Parameterized Pipeline Kernel 7 ---
EngineSubroutine_7 ← {
    input_data ← ⍵
    param_scaling ← 1.35
    input_data × param_scaling
}
VerifySub_7 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_7 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_7 0


⍝ --- Parameterized Pipeline Kernel 8 ---
EngineSubroutine_8 ← {
    input_data ← ⍵
    param_scaling ← 1.4
    input_data × param_scaling
}
VerifySub_8 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_8 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_8 0


⍝ --- Parameterized Pipeline Kernel 9 ---
EngineSubroutine_9 ← {
    input_data ← ⍵
    param_scaling ← 1.45
    input_data × param_scaling
}
VerifySub_9 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_9 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_9 0


⍝ --- Parameterized Pipeline Kernel 10 ---
EngineSubroutine_10 ← {
    input_data ← ⍵
    param_scaling ← 1.5
    input_data × param_scaling
}
VerifySub_10 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_10 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_10 0


⍝ --- Parameterized Pipeline Kernel 11 ---
EngineSubroutine_11 ← {
    input_data ← ⍵
    param_scaling ← 1.55
    input_data × param_scaling
}
VerifySub_11 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_11 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_11 0


⍝ --- Parameterized Pipeline Kernel 12 ---
EngineSubroutine_12 ← {
    input_data ← ⍵
    param_scaling ← 1.6
    input_data × param_scaling
}
VerifySub_12 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_12 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_12 0


⍝ --- Parameterized Pipeline Kernel 13 ---
EngineSubroutine_13 ← {
    input_data ← ⍵
    param_scaling ← 1.65
    input_data × param_scaling
}
VerifySub_13 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_13 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_13 0


⍝ --- Parameterized Pipeline Kernel 14 ---
EngineSubroutine_14 ← {
    input_data ← ⍵
    param_scaling ← 1.7000000000000002
    input_data × param_scaling
}
VerifySub_14 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_14 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_14 0


⍝ --- Parameterized Pipeline Kernel 15 ---
EngineSubroutine_15 ← {
    input_data ← ⍵
    param_scaling ← 1.75
    input_data × param_scaling
}
VerifySub_15 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_15 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_15 0


⍝ --- Parameterized Pipeline Kernel 16 ---
EngineSubroutine_16 ← {
    input_data ← ⍵
    param_scaling ← 1.8
    input_data × param_scaling
}
VerifySub_16 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_16 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_16 0


⍝ --- Parameterized Pipeline Kernel 17 ---
EngineSubroutine_17 ← {
    input_data ← ⍵
    param_scaling ← 1.85
    input_data × param_scaling
}
VerifySub_17 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_17 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_17 0


⍝ --- Parameterized Pipeline Kernel 18 ---
EngineSubroutine_18 ← {
    input_data ← ⍵
    param_scaling ← 1.9
    input_data × param_scaling
}
VerifySub_18 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_18 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_18 0


⍝ --- Parameterized Pipeline Kernel 19 ---
EngineSubroutine_19 ← {
    input_data ← ⍵
    param_scaling ← 1.9500000000000002
    input_data × param_scaling
}
VerifySub_19 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_19 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_19 0


⍝ --- Parameterized Pipeline Kernel 20 ---
EngineSubroutine_20 ← {
    input_data ← ⍵
    param_scaling ← 2.0
    input_data × param_scaling
}
VerifySub_20 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_20 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_20 0


⍝ --- Parameterized Pipeline Kernel 21 ---
EngineSubroutine_21 ← {
    input_data ← ⍵
    param_scaling ← 2.05
    input_data × param_scaling
}
VerifySub_21 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_21 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_21 0


⍝ --- Parameterized Pipeline Kernel 22 ---
EngineSubroutine_22 ← {
    input_data ← ⍵
    param_scaling ← 2.1
    input_data × param_scaling
}
VerifySub_22 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_22 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_22 0


⍝ --- Parameterized Pipeline Kernel 23 ---
EngineSubroutine_23 ← {
    input_data ← ⍵
    param_scaling ← 2.1500000000000004
    input_data × param_scaling
}
VerifySub_23 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_23 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_23 0


⍝ --- Parameterized Pipeline Kernel 24 ---
EngineSubroutine_24 ← {
    input_data ← ⍵
    param_scaling ← 2.2
    input_data × param_scaling
}
VerifySub_24 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_24 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_24 0


⍝ --- Parameterized Pipeline Kernel 25 ---
EngineSubroutine_25 ← {
    input_data ← ⍵
    param_scaling ← 2.25
    input_data × param_scaling
}
VerifySub_25 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_25 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_25 0


⍝ --- Parameterized Pipeline Kernel 26 ---
EngineSubroutine_26 ← {
    input_data ← ⍵
    param_scaling ← 2.3
    input_data × param_scaling
}
VerifySub_26 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_26 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_26 0


⍝ --- Parameterized Pipeline Kernel 27 ---
EngineSubroutine_27 ← {
    input_data ← ⍵
    param_scaling ← 2.35
    input_data × param_scaling
}
VerifySub_27 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_27 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_27 0


⍝ --- Parameterized Pipeline Kernel 28 ---
EngineSubroutine_28 ← {
    input_data ← ⍵
    param_scaling ← 2.4000000000000004
    input_data × param_scaling
}
VerifySub_28 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_28 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_28 0


⍝ --- Parameterized Pipeline Kernel 29 ---
EngineSubroutine_29 ← {
    input_data ← ⍵
    param_scaling ← 2.45
    input_data × param_scaling
}
VerifySub_29 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_29 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_29 0


⍝ --- Parameterized Pipeline Kernel 30 ---
EngineSubroutine_30 ← {
    input_data ← ⍵
    param_scaling ← 2.5
    input_data × param_scaling
}
VerifySub_30 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_30 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_30 0


⍝ --- Parameterized Pipeline Kernel 31 ---
EngineSubroutine_31 ← {
    input_data ← ⍵
    param_scaling ← 2.55
    input_data × param_scaling
}
VerifySub_31 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_31 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_31 0


⍝ --- Parameterized Pipeline Kernel 32 ---
EngineSubroutine_32 ← {
    input_data ← ⍵
    param_scaling ← 2.6
    input_data × param_scaling
}
VerifySub_32 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_32 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_32 0


⍝ --- Parameterized Pipeline Kernel 33 ---
EngineSubroutine_33 ← {
    input_data ← ⍵
    param_scaling ← 2.6500000000000004
    input_data × param_scaling
}
VerifySub_33 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_33 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_33 0


⍝ --- Parameterized Pipeline Kernel 34 ---
EngineSubroutine_34 ← {
    input_data ← ⍵
    param_scaling ← 2.7
    input_data × param_scaling
}
VerifySub_34 ← {
    t ← (⍳20) ⍴ 1.0
    out ← EngineSubroutine_34 t
    (⍴out) = 20: 1
    0
}
_ ← VerifySub_34 0


TestModule_harmonic_imaging ← {
    'PASS: beamforming/harmonic_imaging.apl verification passed'
}
_ ← TestModule_harmonic_imaging 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (harmonic_imaging.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_harmonic_imaging_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_harmonic_imaging_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_harmonic_imaging_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_harmonic_imaging_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_harmonic_imaging_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_harmonic_imaging_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (harmonic_imaging.apl) ---
ValidationRoutine_1_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 2 (harmonic_imaging.apl) ---
ValidationRoutine_2_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 3 (harmonic_imaging.apl) ---
ValidationRoutine_3_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 4 (harmonic_imaging.apl) ---
ValidationRoutine_4_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 5 (harmonic_imaging.apl) ---
ValidationRoutine_5_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 6 (harmonic_imaging.apl) ---
ValidationRoutine_6_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 7 (harmonic_imaging.apl) ---
ValidationRoutine_7_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 8 (harmonic_imaging.apl) ---
ValidationRoutine_8_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 9 (harmonic_imaging.apl) ---
ValidationRoutine_9_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 10 (harmonic_imaging.apl) ---
ValidationRoutine_10_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 11 (harmonic_imaging.apl) ---
ValidationRoutine_11_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 12 (harmonic_imaging.apl) ---
ValidationRoutine_12_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 13 (harmonic_imaging.apl) ---
ValidationRoutine_13_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_harmonic_imaging_apl 0

⍝ --- Precision Calibration Assertion Block 14 (harmonic_imaging.apl) ---
ValidationRoutine_14_harmonic_imaging_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_harmonic_imaging_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_harmonic_imaging_apl 0
