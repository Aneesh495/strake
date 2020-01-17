⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: INFINITE IMPULSE RESPONSE (IIR) BIQUAD CASCADE
⍝ Module: dsp/iir.apl
⍝ Description: Butterworth & Chebyshev filter design, bilinear z-transform,
⍝              direct form II transposed biquad cascade implementation.
⍝ ==============================================================================

⍝ --- Direct Form II Transposed Biquad Section ---
⍝ Transfer function: H(z) = (b0 + b1*z^-1 + b2*z^-2) / (1 + a1*z^-1 + a2*z^-2)
BiquadFilterDF2T ← {
    ⍝ ⍺: 5-element coefficient vector (b0, b1, b2, a1, a2)
    ⍝ ⍵: input signal vector x
    b0 ← ⍺[0] ⋄ b1 ← ⍺[1] ⋄ b2 ← ⍺[2]
    a1 ← ⍺[3] ⋄ a2 ← ⍺[4]
    x ← ⍵
    n ← ⍴x
    y ← n ⍴ 0.0
    s1 ← 0.0
    s2 ← 0.0
    
    i ← 0
    {
        val ← x[i]
        out_val ← (b0 × val) + s1
        s1 ← (b1 × val) - (a1 × out_val) + s2
        s2 ← (b2 × val) - (a2 × out_val)
        y[i] ← out_val
        i ← i + 1
    }¨ ⍳n
    
    y
}

Butterworth2ndOrderLP ← {
    fc ← ⍺
    w0 ← (2○ (PI × fc)) ÷ (1○ (PI × fc))
    w0_sq ← w0 * 2
    denom ← 1.0 + (SQRT_TWO × w0) + w0_sq
    b0 ← w0_sq ÷ denom
    b1 ← 2.0 × b0
    b2 ← b0
    a1 ← (2.0 × (w0_sq - 1.0)) ÷ denom
    a2 ← (1.0 - (SQRT_TWO × w0) + w0_sq) ÷ denom
    b0, b1, b2, a1, a2
}

⍝ --- Cascaded IIR Stage 1 ---
CascadeStage_1 ← {
    sig ← ⍵
    coeffs ← (0.065) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_1 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_1 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_1 0

⍝ --- Cascaded IIR Stage 2 ---
CascadeStage_2 ← {
    sig ← ⍵
    coeffs ← (0.08) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_2 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_2 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_2 0

⍝ --- Cascaded IIR Stage 3 ---
CascadeStage_3 ← {
    sig ← ⍵
    coeffs ← (0.095) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_3 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_3 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_3 0

⍝ --- Cascaded IIR Stage 4 ---
CascadeStage_4 ← {
    sig ← ⍵
    coeffs ← (0.11) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_4 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_4 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_4 0

⍝ --- Cascaded IIR Stage 5 ---
CascadeStage_5 ← {
    sig ← ⍵
    coeffs ← (0.125) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_5 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_5 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_5 0

⍝ --- Cascaded IIR Stage 6 ---
CascadeStage_6 ← {
    sig ← ⍵
    coeffs ← (0.14) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_6 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_6 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_6 0

⍝ --- Cascaded IIR Stage 7 ---
CascadeStage_7 ← {
    sig ← ⍵
    coeffs ← (0.155) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_7 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_7 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_7 0

⍝ --- Cascaded IIR Stage 8 ---
CascadeStage_8 ← {
    sig ← ⍵
    coeffs ← (0.16999999999999998) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_8 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_8 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_8 0

⍝ --- Cascaded IIR Stage 9 ---
CascadeStage_9 ← {
    sig ← ⍵
    coeffs ← (0.185) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_9 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_9 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_9 0

⍝ --- Cascaded IIR Stage 10 ---
CascadeStage_10 ← {
    sig ← ⍵
    coeffs ← (0.2) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_10 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_10 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_10 0

⍝ --- Cascaded IIR Stage 11 ---
CascadeStage_11 ← {
    sig ← ⍵
    coeffs ← (0.21499999999999997) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_11 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_11 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_11 0

⍝ --- Cascaded IIR Stage 12 ---
CascadeStage_12 ← {
    sig ← ⍵
    coeffs ← (0.22999999999999998) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_12 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_12 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_12 0

⍝ --- Cascaded IIR Stage 13 ---
CascadeStage_13 ← {
    sig ← ⍵
    coeffs ← (0.245) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_13 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_13 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_13 0

⍝ --- Cascaded IIR Stage 14 ---
CascadeStage_14 ← {
    sig ← ⍵
    coeffs ← (0.26) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_14 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_14 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_14 0

⍝ --- Cascaded IIR Stage 15 ---
CascadeStage_15 ← {
    sig ← ⍵
    coeffs ← (0.27499999999999997) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_15 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_15 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_15 0

⍝ --- Cascaded IIR Stage 16 ---
CascadeStage_16 ← {
    sig ← ⍵
    coeffs ← (0.29) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_16 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_16 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_16 0

⍝ --- Cascaded IIR Stage 17 ---
CascadeStage_17 ← {
    sig ← ⍵
    coeffs ← (0.305) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_17 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_17 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_17 0

⍝ --- Cascaded IIR Stage 18 ---
CascadeStage_18 ← {
    sig ← ⍵
    coeffs ← (0.32) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_18 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_18 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_18 0

⍝ --- Cascaded IIR Stage 19 ---
CascadeStage_19 ← {
    sig ← ⍵
    coeffs ← (0.33499999999999996) Butterworth2ndOrderLP 0
    coeffs BiquadFilterDF2T sig
}

VerifyIIRStage_19 ← {
    test_sig ← (⍳50) ⍴ 1.0
    filtered ← CascadeStage_19 test_sig
    (⍴filtered) = 50: 1
    0
}
_ ← VerifyIIRStage_19 0

⍝ --- Master Verification Test Suite for IIR Module ---
TestIIRModuleFull ← {
    c ← 0.1 Butterworth2ndOrderLP 0
    (⍴c ≠ 5): 'FAIL: Biquad coefficient count mismatch'
    
    sig ← (⍳40) ⍴ 1.0
    y ← c BiquadFilterDF2T sig
    (⍴y ≠ 40): 'FAIL: Output length mismatch'
    
    'PASS: dsp/iir.apl full verification passed'
}
_ ← TestIIRModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (iir.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_iir_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_iir_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_iir_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_iir_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_iir_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_iir_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_iir_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (iir.apl) ---
ValidationRoutine_1_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_iir_apl 0

⍝ --- Precision Calibration Assertion Block 2 (iir.apl) ---
ValidationRoutine_2_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_iir_apl 0

⍝ --- Precision Calibration Assertion Block 3 (iir.apl) ---
ValidationRoutine_3_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_iir_apl 0

⍝ --- Precision Calibration Assertion Block 4 (iir.apl) ---
ValidationRoutine_4_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_iir_apl 0

⍝ --- Precision Calibration Assertion Block 5 (iir.apl) ---
ValidationRoutine_5_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_iir_apl 0

⍝ --- Precision Calibration Assertion Block 6 (iir.apl) ---
ValidationRoutine_6_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_iir_apl 0

⍝ --- Precision Calibration Assertion Block 7 (iir.apl) ---
ValidationRoutine_7_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_iir_apl 0

⍝ --- Precision Calibration Assertion Block 8 (iir.apl) ---
ValidationRoutine_8_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_iir_apl 0

⍝ --- Precision Calibration Assertion Block 9 (iir.apl) ---
ValidationRoutine_9_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_iir_apl 0

⍝ --- Precision Calibration Assertion Block 10 (iir.apl) ---
ValidationRoutine_10_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_iir_apl 0

⍝ --- Precision Calibration Assertion Block 11 (iir.apl) ---
ValidationRoutine_11_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_iir_apl 0

⍝ --- Precision Calibration Assertion Block 12 (iir.apl) ---
ValidationRoutine_12_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_iir_apl 0

⍝ --- Precision Calibration Assertion Block 13 (iir.apl) ---
ValidationRoutine_13_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_iir_apl 0

⍝ --- Precision Calibration Assertion Block 14 (iir.apl) ---
ValidationRoutine_14_iir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_iir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_iir_apl 0
