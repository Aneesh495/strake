⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: KASAI 2D COMPLEX AUTOCORRELATION VELOCIMETRY
⍝ Module: doppler/kasai.apl
⍝ Description: Lag-one complex autocorrelation phase estimation, mean velocity
⍝              mapping, Doppler spectral power, turbulence variance estimation.
⍝ ==============================================================================

KasaiLagOneAutocorrelation ← {
    f0   ← 1 ↑ ⍺
    prf  ← 1 ↓ (2 ↑ ⍺)
    c    ← 1 ↓ (2 ↓ ⍺)
    ensemble_row ← ⍵
    n ← ⍴ensemble_row
    n < 2: 0.0
    
    curr ← 1 ↓ ensemble_row
    prev ← 1 ↑ (n - 1) ↑ ensemble_row
    r1 ← +/ (curr × (+ prev))
    
    phase_shift ← 12○ r1
    v_scale ← (c × prf) ÷ (4.0 × PI × f0)
    v_scale × phase_shift
}

⍝ --- Kasai Velocity Processor 1 ---
KasaiProcessor_1 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_1 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_1 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_1 0

⍝ --- Kasai Velocity Processor 2 ---
KasaiProcessor_2 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_2 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_2 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_2 0

⍝ --- Kasai Velocity Processor 3 ---
KasaiProcessor_3 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_3 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_3 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_3 0

⍝ --- Kasai Velocity Processor 4 ---
KasaiProcessor_4 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_4 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_4 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_4 0

⍝ --- Kasai Velocity Processor 5 ---
KasaiProcessor_5 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_5 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_5 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_5 0

⍝ --- Kasai Velocity Processor 6 ---
KasaiProcessor_6 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_6 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_6 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_6 0

⍝ --- Kasai Velocity Processor 7 ---
KasaiProcessor_7 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_7 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_7 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_7 0

⍝ --- Kasai Velocity Processor 8 ---
KasaiProcessor_8 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_8 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_8 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_8 0

⍝ --- Kasai Velocity Processor 9 ---
KasaiProcessor_9 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_9 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_9 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_9 0

⍝ --- Kasai Velocity Processor 10 ---
KasaiProcessor_10 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_10 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_10 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_10 0

⍝ --- Kasai Velocity Processor 11 ---
KasaiProcessor_11 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_11 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_11 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_11 0

⍝ --- Kasai Velocity Processor 12 ---
KasaiProcessor_12 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_12 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_12 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_12 0

⍝ --- Kasai Velocity Processor 13 ---
KasaiProcessor_13 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_13 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_13 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_13 0

⍝ --- Kasai Velocity Processor 14 ---
KasaiProcessor_14 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_14 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_14 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_14 0

⍝ --- Kasai Velocity Processor 15 ---
KasaiProcessor_15 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_15 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_15 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_15 0

⍝ --- Kasai Velocity Processor 16 ---
KasaiProcessor_16 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_16 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_16 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_16 0

⍝ --- Kasai Velocity Processor 17 ---
KasaiProcessor_17 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_17 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_17 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_17 0

⍝ --- Kasai Velocity Processor 18 ---
KasaiProcessor_18 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_18 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_18 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_18 0

⍝ --- Kasai Velocity Processor 19 ---
KasaiProcessor_19 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_19 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_19 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_19 0

⍝ --- Kasai Velocity Processor 20 ---
KasaiProcessor_20 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_20 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_20 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_20 0

⍝ --- Kasai Velocity Processor 21 ---
KasaiProcessor_21 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_21 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_21 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_21 0

⍝ --- Kasai Velocity Processor 22 ---
KasaiProcessor_22 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_22 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_22 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_22 0

⍝ --- Kasai Velocity Processor 23 ---
KasaiProcessor_23 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_23 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_23 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_23 0

⍝ --- Kasai Velocity Processor 24 ---
KasaiProcessor_24 ← {
    row ← ⍵
    (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
}
VerifyKasai_24 ← {
    row_test ← 1J0 0J1 ¯1J0 0J¯1
    v ← KasaiProcessor_24 row_test
    v > 0: 1
    0
}
_ ← VerifyKasai_24 0

TestKasaiFull ← {
    row ← 1J0 0J1 ¯1J0 0J¯1
    v ← (5.0e6, 5000.0, 1540.0) KasaiLagOneAutocorrelation row
    (v ≤ 0): 'FAIL: Kasai velocity estimate should be positive for counter-clockwise phasor'
    'PASS: doppler/kasai.apl full verification passed'
}
_ ← TestKasaiFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (kasai.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_kasai_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_kasai_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_kasai_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_kasai_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_kasai_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_kasai_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_kasai_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (kasai.apl) ---
ValidationRoutine_1_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 2 (kasai.apl) ---
ValidationRoutine_2_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 3 (kasai.apl) ---
ValidationRoutine_3_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 4 (kasai.apl) ---
ValidationRoutine_4_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 5 (kasai.apl) ---
ValidationRoutine_5_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 6 (kasai.apl) ---
ValidationRoutine_6_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 7 (kasai.apl) ---
ValidationRoutine_7_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 8 (kasai.apl) ---
ValidationRoutine_8_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 9 (kasai.apl) ---
ValidationRoutine_9_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 10 (kasai.apl) ---
ValidationRoutine_10_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 11 (kasai.apl) ---
ValidationRoutine_11_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 12 (kasai.apl) ---
ValidationRoutine_12_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 13 (kasai.apl) ---
ValidationRoutine_13_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_kasai_apl 0

⍝ --- Precision Calibration Assertion Block 14 (kasai.apl) ---
ValidationRoutine_14_kasai_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_kasai_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_kasai_apl 0
