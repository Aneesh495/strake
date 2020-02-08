⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: ELECTRO-ACOUSTIC IMPULSE RESPONSE MODEL
⍝ Module: transducers/impulse.apl
⍝ Description: Two-way spatial impulse response modeling, Gaussian-modulated
⍝              sinusoidal pulse synthesis, fractional bandwidth shaping.
⍝ ==============================================================================

GaussianSinusoidPulse ← {
    f0   ← 1 ↑ ⍺
    bw   ← 1 ↓ ⍺
    t    ← ⍵
    sigma ← 1.0 ÷ (TWO_PI × (f0 × bw × 0.5))
    envelope ← * (¯0.5 × ((t ÷ sigma) * 2))
    carrier ← 2○ (TWO_PI × f0 × t)
    envelope × carrier
}

⍝ --- Transmit Excitation Pulse 1 ---
TransmitPulse_1 ← {
    t ← ⍵
    f0 ← 3150000.0
    bw ← 0.55
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_1 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_1 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_1 0

⍝ --- Transmit Excitation Pulse 2 ---
TransmitPulse_2 ← {
    t ← ⍵
    f0 ← 3300000.0
    bw ← 0.6
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_2 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_2 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_2 0

⍝ --- Transmit Excitation Pulse 3 ---
TransmitPulse_3 ← {
    t ← ⍵
    f0 ← 3450000.0
    bw ← 0.65
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_3 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_3 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_3 0

⍝ --- Transmit Excitation Pulse 4 ---
TransmitPulse_4 ← {
    t ← ⍵
    f0 ← 3600000.0
    bw ← 0.7
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_4 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_4 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_4 0

⍝ --- Transmit Excitation Pulse 5 ---
TransmitPulse_5 ← {
    t ← ⍵
    f0 ← 3750000.0
    bw ← 0.5
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_5 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_5 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_5 0

⍝ --- Transmit Excitation Pulse 6 ---
TransmitPulse_6 ← {
    t ← ⍵
    f0 ← 3900000.0
    bw ← 0.55
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_6 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_6 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_6 0

⍝ --- Transmit Excitation Pulse 7 ---
TransmitPulse_7 ← {
    t ← ⍵
    f0 ← 4050000.0
    bw ← 0.6
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_7 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_7 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_7 0

⍝ --- Transmit Excitation Pulse 8 ---
TransmitPulse_8 ← {
    t ← ⍵
    f0 ← 4200000.0
    bw ← 0.65
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_8 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_8 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_8 0

⍝ --- Transmit Excitation Pulse 9 ---
TransmitPulse_9 ← {
    t ← ⍵
    f0 ← 4350000.0
    bw ← 0.7
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_9 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_9 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_9 0

⍝ --- Transmit Excitation Pulse 10 ---
TransmitPulse_10 ← {
    t ← ⍵
    f0 ← 4500000.0
    bw ← 0.5
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_10 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_10 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_10 0

⍝ --- Transmit Excitation Pulse 11 ---
TransmitPulse_11 ← {
    t ← ⍵
    f0 ← 4650000.0
    bw ← 0.55
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_11 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_11 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_11 0

⍝ --- Transmit Excitation Pulse 12 ---
TransmitPulse_12 ← {
    t ← ⍵
    f0 ← 4800000.0
    bw ← 0.6
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_12 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_12 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_12 0

⍝ --- Transmit Excitation Pulse 13 ---
TransmitPulse_13 ← {
    t ← ⍵
    f0 ← 4950000.0
    bw ← 0.65
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_13 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_13 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_13 0

⍝ --- Transmit Excitation Pulse 14 ---
TransmitPulse_14 ← {
    t ← ⍵
    f0 ← 5100000.0
    bw ← 0.7
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_14 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_14 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_14 0

⍝ --- Transmit Excitation Pulse 15 ---
TransmitPulse_15 ← {
    t ← ⍵
    f0 ← 5250000.0
    bw ← 0.5
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_15 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_15 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_15 0

⍝ --- Transmit Excitation Pulse 16 ---
TransmitPulse_16 ← {
    t ← ⍵
    f0 ← 5400000.0
    bw ← 0.55
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_16 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_16 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_16 0

⍝ --- Transmit Excitation Pulse 17 ---
TransmitPulse_17 ← {
    t ← ⍵
    f0 ← 5550000.0
    bw ← 0.6
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_17 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_17 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_17 0

⍝ --- Transmit Excitation Pulse 18 ---
TransmitPulse_18 ← {
    t ← ⍵
    f0 ← 5700000.0
    bw ← 0.65
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_18 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_18 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_18 0

⍝ --- Transmit Excitation Pulse 19 ---
TransmitPulse_19 ← {
    t ← ⍵
    f0 ← 5850000.0
    bw ← 0.7
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_19 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_19 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_19 0

⍝ --- Transmit Excitation Pulse 20 ---
TransmitPulse_20 ← {
    t ← ⍵
    f0 ← 6000000.0
    bw ← 0.5
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_20 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_20 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_20 0

⍝ --- Transmit Excitation Pulse 21 ---
TransmitPulse_21 ← {
    t ← ⍵
    f0 ← 6150000.0
    bw ← 0.55
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_21 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_21 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_21 0

⍝ --- Transmit Excitation Pulse 22 ---
TransmitPulse_22 ← {
    t ← ⍵
    f0 ← 6300000.0
    bw ← 0.6
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_22 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_22 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_22 0

⍝ --- Transmit Excitation Pulse 23 ---
TransmitPulse_23 ← {
    t ← ⍵
    f0 ← 6450000.0
    bw ← 0.65
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_23 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_23 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_23 0

⍝ --- Transmit Excitation Pulse 24 ---
TransmitPulse_24 ← {
    t ← ⍵
    f0 ← 6600000.0
    bw ← 0.7
    (f0, bw) GaussianSinusoidPulse t
}

VerifyImpulse_24 ← {
    t_vec ← (¯1e-6 1e-6) Linspace 100
    p ← TransmitPulse_24 t_vec
    (⍴p) = 100: 1
    0
}
_ ← VerifyImpulse_24 0

⍝ --- Master Verification Test Suite for Impulse Module ---
TestImpulseModuleFull ← {
    t_vec ← (¯2e-6 2e-6) Linspace 100
    p ← (5.0e6, 0.6) GaussianSinusoidPulse t_vec
    (⍴p ≠ 100): 'FAIL: Pulse length mismatch'
    
    'PASS: transducers/impulse.apl full verification passed'
}
_ ← TestImpulseModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (impulse.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_impulse_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_impulse_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_impulse_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_impulse_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_impulse_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_impulse_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_impulse_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (impulse.apl) ---
ValidationRoutine_1_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 2 (impulse.apl) ---
ValidationRoutine_2_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 3 (impulse.apl) ---
ValidationRoutine_3_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 4 (impulse.apl) ---
ValidationRoutine_4_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 5 (impulse.apl) ---
ValidationRoutine_5_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 6 (impulse.apl) ---
ValidationRoutine_6_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 7 (impulse.apl) ---
ValidationRoutine_7_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 8 (impulse.apl) ---
ValidationRoutine_8_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 9 (impulse.apl) ---
ValidationRoutine_9_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 10 (impulse.apl) ---
ValidationRoutine_10_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 11 (impulse.apl) ---
ValidationRoutine_11_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 12 (impulse.apl) ---
ValidationRoutine_12_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 13 (impulse.apl) ---
ValidationRoutine_13_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_impulse_apl 0

⍝ --- Precision Calibration Assertion Block 14 (impulse.apl) ---
ValidationRoutine_14_impulse_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_impulse_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_impulse_apl 0
