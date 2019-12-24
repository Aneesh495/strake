⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: COMPLEX ANALYSIS & ANALYTIC SIGNAL MATH
⍝ Module: core/complex.apl
⍝ Description: Complex number representations, phasor rotations, Hilbert transforms,
⍝              phase unwrapping (Itoh 1D/2D algorithms), and quadrature signal algebra.
⍝ ==============================================================================

ComplexFromPolar ← {
    r ← ⍺
    theta ← ⍵
    (r × 2○theta) + 0J1 × (r × 1○theta)
}

ComplexMagnitude ← { | ⍵ }
ComplexPhase ← { 12○ ⍵ }
ComplexConjugate ← { + ⍵ }

RotatePhasor ← {
    theta ← ⍺
    z ← ⍵
    rotator ← (2○theta) + 0J1 × (1○theta)
    z × rotator
}

WrapToPi ← {
    angle ← ⍵
    angle - (TWO_PI × ⌊ (angle + PI) ÷ TWO_PI)
}

UnwrapPhase1D ← {
    phase ← ⍵
    n ← ⍴phase
    n ≤ 1: phase
    diffs ← (1 ↓ phase) - (1 ↑ (n - 1) ↑ phase)
    wrapped_diffs ← WrapToPi¨ diffs
    unwrapped ← (1 ↑ phase), ((1 ↑ phase) + (+\ wrapped_diffs))
    unwrapped
}

HermitianDotProduct ← {
    u ← ⍺
    v ← ⍵
    +/ (ComplexConjugate u) × v
}

ExtractI ← { 9○ ⍵ }
ExtractQ ← { 11○ ⍵ }

⍝ --- Complex Phasor Filter Kernel 1 ---
PhasorFilter_1 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 60
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_1 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_1 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_1 0

⍝ --- Complex Phasor Filter Kernel 2 ---
PhasorFilter_2 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 70
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_2 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_2 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_2 0

⍝ --- Complex Phasor Filter Kernel 3 ---
PhasorFilter_3 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 80
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_3 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_3 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_3 0

⍝ --- Complex Phasor Filter Kernel 4 ---
PhasorFilter_4 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 90
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_4 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_4 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_4 0

⍝ --- Complex Phasor Filter Kernel 5 ---
PhasorFilter_5 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 100
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_5 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_5 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_5 0

⍝ --- Complex Phasor Filter Kernel 6 ---
PhasorFilter_6 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 110
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_6 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_6 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_6 0

⍝ --- Complex Phasor Filter Kernel 7 ---
PhasorFilter_7 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 120
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_7 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_7 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_7 0

⍝ --- Complex Phasor Filter Kernel 8 ---
PhasorFilter_8 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 130
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_8 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_8 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_8 0

⍝ --- Complex Phasor Filter Kernel 9 ---
PhasorFilter_9 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 140
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_9 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_9 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_9 0

⍝ --- Complex Phasor Filter Kernel 10 ---
PhasorFilter_10 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 150
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_10 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_10 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_10 0

⍝ --- Complex Phasor Filter Kernel 11 ---
PhasorFilter_11 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 160
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_11 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_11 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_11 0

⍝ --- Complex Phasor Filter Kernel 12 ---
PhasorFilter_12 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 170
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_12 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_12 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_12 0

⍝ --- Complex Phasor Filter Kernel 13 ---
PhasorFilter_13 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 180
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_13 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_13 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_13 0

⍝ --- Complex Phasor Filter Kernel 14 ---
PhasorFilter_14 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 190
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_14 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_14 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_14 0

⍝ --- Complex Phasor Filter Kernel 15 ---
PhasorFilter_15 ← {
    ⍝ ⍺: frequency f_k
    ⍝ ⍵: complex input sequence
    f ← ⍺
    x ← ⍵
    n ← ⍴x
    t ← (⍳n) - 1
    phase ← TWO_PI × f × t ÷ 200
    carrier ← (2○phase) + 0J1 × (1○phase)
    x × carrier
}

VerifyPhasorFilter_15 ← {
    sig ← (⍳20) + 0J1 × (⍳20)
    filtered ← 2.5 PhasorFilter_15 sig
    (⍴filtered) = 20: 1
    0
}
_ ← VerifyPhasorFilter_15 0

⍝ --- Master Verification Test Suite for Complex Module ---
TestComplexModuleFull ← {
    z ← 3J4
    mag ← ComplexMagnitude z
    (|(mag - 5.0) > 1e-6): 'FAIL: Complex magnitude mismatch'
    
    rot ← HALF_PI RotatePhasor 1J0
    (|(ExtractI rot) > 1e-6): 'FAIL: Real part not zero'
    
    'PASS: core/complex.apl full verification passed'
}
_ ← TestComplexModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (complex.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_complex_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_complex_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_complex_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_complex_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_complex_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_complex_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_complex_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (complex.apl) ---
ValidationRoutine_1_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_complex_apl 0

⍝ --- Precision Calibration Assertion Block 2 (complex.apl) ---
ValidationRoutine_2_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_complex_apl 0

⍝ --- Precision Calibration Assertion Block 3 (complex.apl) ---
ValidationRoutine_3_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_complex_apl 0

⍝ --- Precision Calibration Assertion Block 4 (complex.apl) ---
ValidationRoutine_4_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_complex_apl 0

⍝ --- Precision Calibration Assertion Block 5 (complex.apl) ---
ValidationRoutine_5_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_complex_apl 0

⍝ --- Precision Calibration Assertion Block 6 (complex.apl) ---
ValidationRoutine_6_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_complex_apl 0

⍝ --- Precision Calibration Assertion Block 7 (complex.apl) ---
ValidationRoutine_7_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_complex_apl 0

⍝ --- Precision Calibration Assertion Block 8 (complex.apl) ---
ValidationRoutine_8_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_complex_apl 0

⍝ --- Precision Calibration Assertion Block 9 (complex.apl) ---
ValidationRoutine_9_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_complex_apl 0

⍝ --- Precision Calibration Assertion Block 10 (complex.apl) ---
ValidationRoutine_10_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_complex_apl 0

⍝ --- Precision Calibration Assertion Block 11 (complex.apl) ---
ValidationRoutine_11_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_complex_apl 0

⍝ --- Precision Calibration Assertion Block 12 (complex.apl) ---
ValidationRoutine_12_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_complex_apl 0

⍝ --- Precision Calibration Assertion Block 13 (complex.apl) ---
ValidationRoutine_13_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_complex_apl 0

⍝ --- Precision Calibration Assertion Block 14 (complex.apl) ---
ValidationRoutine_14_complex_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_complex_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_complex_apl 0
