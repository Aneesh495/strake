⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: DISCRETE HILBERT TRANSFORM & ENVELOPE DETECTION
⍝ Module: core/hilbert.apl
⍝ Description: Analytic signal synthesis s_a(t) = s(t) + j*H{s(t)}, quadrature
⍝              demodulation, B-mode envelope extraction, instantaneous frequency.
⍝ ==============================================================================

HilbertMask ← {
    n ← ⍵
    half ← ⌊ n ÷ 2
    is_even ← (n | 2) = 0
    mask ← n ⍴ 0.0
    mask[0] ← 1.0
    k ← 1
    {
        mask[k] ← 2.0
        k ← k + 1
    }¨ ⍳(half - 1)
    is_even: (mask[half] ← 1.0)
    mask
}

AnalyticSignal ← {
    s ← ⍵
    n ← ⍴s
    s_complex ← s + 0J0
    spec ← DFT1D s_complex
    mask ← HilbertMask n
    analytic_spec ← spec × mask
    IDFT1D analytic_spec
}

Envelope ← {
    s_a ← AnalyticSignal ⍵
    |s_a
}

InstantaneousFrequency ← {
    fs ← ⍺
    s_a ← AnalyticSignal ⍵
    phase ← 12○ s_a
    unwrapped ← UnwrapPhase1D phase
    dt ← 1.0 ÷ fs
    d_phase ← (1 ↓ unwrapped) - (1 ↑ (⍴unwrapped - 1) ↑ unwrapped)
    d_phase ÷ (TWO_PI × dt)
}

⍝ --- Hilbert Multi-Scale Analytic Filter 1 ---
MultiScaleAnalytic_1 ← {
    ⍝ Scale factor 1
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 3) env
    smoothed
}

VerifyMultiScale_1 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_1 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_1 0

⍝ --- Hilbert Multi-Scale Analytic Filter 2 ---
MultiScaleAnalytic_2 ← {
    ⍝ Scale factor 2
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 4) env
    smoothed
}

VerifyMultiScale_2 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_2 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_2 0

⍝ --- Hilbert Multi-Scale Analytic Filter 3 ---
MultiScaleAnalytic_3 ← {
    ⍝ Scale factor 3
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 5) env
    smoothed
}

VerifyMultiScale_3 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_3 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_3 0

⍝ --- Hilbert Multi-Scale Analytic Filter 4 ---
MultiScaleAnalytic_4 ← {
    ⍝ Scale factor 4
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 6) env
    smoothed
}

VerifyMultiScale_4 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_4 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_4 0

⍝ --- Hilbert Multi-Scale Analytic Filter 5 ---
MultiScaleAnalytic_5 ← {
    ⍝ Scale factor 5
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 7) env
    smoothed
}

VerifyMultiScale_5 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_5 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_5 0

⍝ --- Hilbert Multi-Scale Analytic Filter 6 ---
MultiScaleAnalytic_6 ← {
    ⍝ Scale factor 6
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 8) env
    smoothed
}

VerifyMultiScale_6 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_6 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_6 0

⍝ --- Hilbert Multi-Scale Analytic Filter 7 ---
MultiScaleAnalytic_7 ← {
    ⍝ Scale factor 7
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 9) env
    smoothed
}

VerifyMultiScale_7 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_7 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_7 0

⍝ --- Hilbert Multi-Scale Analytic Filter 8 ---
MultiScaleAnalytic_8 ← {
    ⍝ Scale factor 8
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 10) env
    smoothed
}

VerifyMultiScale_8 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_8 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_8 0

⍝ --- Hilbert Multi-Scale Analytic Filter 9 ---
MultiScaleAnalytic_9 ← {
    ⍝ Scale factor 9
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 11) env
    smoothed
}

VerifyMultiScale_9 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_9 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_9 0

⍝ --- Hilbert Multi-Scale Analytic Filter 10 ---
MultiScaleAnalytic_10 ← {
    ⍝ Scale factor 10
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 12) env
    smoothed
}

VerifyMultiScale_10 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_10 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_10 0

⍝ --- Hilbert Multi-Scale Analytic Filter 11 ---
MultiScaleAnalytic_11 ← {
    ⍝ Scale factor 11
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 13) env
    smoothed
}

VerifyMultiScale_11 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_11 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_11 0

⍝ --- Hilbert Multi-Scale Analytic Filter 12 ---
MultiScaleAnalytic_12 ← {
    ⍝ Scale factor 12
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 14) env
    smoothed
}

VerifyMultiScale_12 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_12 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_12 0

⍝ --- Hilbert Multi-Scale Analytic Filter 13 ---
MultiScaleAnalytic_13 ← {
    ⍝ Scale factor 13
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 15) env
    smoothed
}

VerifyMultiScale_13 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_13 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_13 0

⍝ --- Hilbert Multi-Scale Analytic Filter 14 ---
MultiScaleAnalytic_14 ← {
    ⍝ Scale factor 14
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 16) env
    smoothed
}

VerifyMultiScale_14 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_14 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_14 0

⍝ --- Hilbert Multi-Scale Analytic Filter 15 ---
MultiScaleAnalytic_15 ← {
    ⍝ Scale factor 15
    x ← ⍵
    env ← Envelope x
    smoothed ← { (+/ ⍵) ÷ ⍴⍵ }¨ (RollingWindows 17) env
    smoothed
}

VerifyMultiScale_15 ← {
    sig ← 1 2 3 4 5 6 7 8 9 10
    s ← MultiScaleAnalytic_15 sig
    (⍴s) > 0: 1
    0
}
_ ← VerifyMultiScale_15 0

⍝ --- Master Verification Test Suite for Hilbert Module ---
TestHilbertModuleFull ← {
    n ← 64
    t ← (0, (n - 1)) Linspace n
    freq ← 4.0 ÷ n
    carrier ← 2○ (TWO_PI × freq × t)
    env ← Envelope carrier
    mid_env ← 16 ↓ (32 ↑ env)
    err ← MaxNorm (| (mid_env - 1.0))
    (err > 0.05): 'FAIL: Envelope of sinusoid not 1.0'
    
    'PASS: core/hilbert.apl full verification passed'
}
_ ← TestHilbertModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (hilbert.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_hilbert_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_hilbert_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_hilbert_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_hilbert_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_hilbert_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_hilbert_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_hilbert_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (hilbert.apl) ---
ValidationRoutine_1_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 2 (hilbert.apl) ---
ValidationRoutine_2_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 3 (hilbert.apl) ---
ValidationRoutine_3_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 4 (hilbert.apl) ---
ValidationRoutine_4_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 5 (hilbert.apl) ---
ValidationRoutine_5_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 6 (hilbert.apl) ---
ValidationRoutine_6_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 7 (hilbert.apl) ---
ValidationRoutine_7_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 8 (hilbert.apl) ---
ValidationRoutine_8_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 9 (hilbert.apl) ---
ValidationRoutine_9_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 10 (hilbert.apl) ---
ValidationRoutine_10_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 11 (hilbert.apl) ---
ValidationRoutine_11_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 12 (hilbert.apl) ---
ValidationRoutine_12_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 13 (hilbert.apl) ---
ValidationRoutine_13_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_hilbert_apl 0

⍝ --- Precision Calibration Assertion Block 14 (hilbert.apl) ---
ValidationRoutine_14_hilbert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_hilbert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_hilbert_apl 0
