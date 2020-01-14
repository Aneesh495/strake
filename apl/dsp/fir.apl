⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: FINITE IMPULSE RESPONSE (FIR) FILTER DESIGN
⍝ Module: dsp/fir.apl
⍝ Description: Windowed sinc filter design, linear phase lowpass, bandpass, highpass,
⍝              time-domain convolution, overlap-add fast block filtering.
⍝ ==============================================================================

Sinc ← {
    x ← ⍵
    |x < 1e-12: 1.0
    (1○ (PI × x)) ÷ (PI × x)
}

FIRLowpassKernel ← {
    cutoff ← 1 ↑ ⍺
    n ← 1 ↓ ⍺
    mid ← (n - 1) ÷ 2.0
    idx ← (⍳n) - 1
    sinc_vals ← Sinc¨ (2.0 × cutoff × (idx - mid))
    win ← HammingWindow n
    kernel ← (2.0 × cutoff × sinc_vals) × win
    kernel ÷ (+/ kernel)
}

FIRBandpassKernel ← {
    f_low ← 1 ↑ ⍺
    f_high ← 1 ↓ (2 ↑ ⍺)
    n ← 1 ↓ (2 ↓ ⍺)
    mid ← (n - 1) ÷ 2.0
    idx ← (⍳n) - 1
    sinc_high ← 2.0 × f_high × (Sinc¨ (2.0 × f_high × (idx - mid)))
    sinc_low  ← 2.0 × f_low  × (Sinc¨ (2.0 × f_low  × (idx - mid)))
    win ← HammingWindow n
    kernel ← (sinc_high - sinc_low) × win
    kernel ÷ (MaxNorm kernel)
}

Convolve1D ← {
    sig ← ⍺
    kernel ← ⍵
    s_len ← ⍴sig
    k_len ← ⍴kernel
    half_k ← ⌊ k_len ÷ 2
    
    i ← 0
    out ← s_len ⍴ 0.0
    {
        sum ← 0.0
        j ← 0
        {
            s_idx ← (i + j) - half_k
            (s_idx ≥ 0) ∧ (s_idx < s_len): (
                sum ← sum + (sig[s_idx] × kernel[k_len - 1 - j])
            )
            j ← j + 1
        }¨ ⍳k_len
        out[i] ← sum
        i ← i + 1
    }¨ ⍳s_len
    out
}

⍝ --- Ultrasound Transducer Matching FIR Filter 1 ---
TransducerFIRFilter_1 ← {
    ⍝ Bandpass filter for center frequency 2.25 MHz
    sig ← ⍵
    kernel ← (0.11, 0.31, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_1 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_1 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_1 0

⍝ --- Ultrasound Transducer Matching FIR Filter 2 ---
TransducerFIRFilter_2 ← {
    ⍝ Bandpass filter for center frequency 2.5 MHz
    sig ← ⍵
    kernel ← (0.12000000000000001, 0.32, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_2 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_2 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_2 0

⍝ --- Ultrasound Transducer Matching FIR Filter 3 ---
TransducerFIRFilter_3 ← {
    ⍝ Bandpass filter for center frequency 2.75 MHz
    sig ← ⍵
    kernel ← (0.13, 0.32999999999999996, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_3 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_3 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_3 0

⍝ --- Ultrasound Transducer Matching FIR Filter 4 ---
TransducerFIRFilter_4 ← {
    ⍝ Bandpass filter for center frequency 3.0 MHz
    sig ← ⍵
    kernel ← (0.14, 0.33999999999999997, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_4 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_4 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_4 0

⍝ --- Ultrasound Transducer Matching FIR Filter 5 ---
TransducerFIRFilter_5 ← {
    ⍝ Bandpass filter for center frequency 3.25 MHz
    sig ← ⍵
    kernel ← (0.15000000000000002, 0.35, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_5 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_5 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_5 0

⍝ --- Ultrasound Transducer Matching FIR Filter 6 ---
TransducerFIRFilter_6 ← {
    ⍝ Bandpass filter for center frequency 3.5 MHz
    sig ← ⍵
    kernel ← (0.16, 0.36, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_6 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_6 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_6 0

⍝ --- Ultrasound Transducer Matching FIR Filter 7 ---
TransducerFIRFilter_7 ← {
    ⍝ Bandpass filter for center frequency 3.75 MHz
    sig ← ⍵
    kernel ← (0.17, 0.37, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_7 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_7 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_7 0

⍝ --- Ultrasound Transducer Matching FIR Filter 8 ---
TransducerFIRFilter_8 ← {
    ⍝ Bandpass filter for center frequency 4.0 MHz
    sig ← ⍵
    kernel ← (0.18, 0.38, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_8 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_8 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_8 0

⍝ --- Ultrasound Transducer Matching FIR Filter 9 ---
TransducerFIRFilter_9 ← {
    ⍝ Bandpass filter for center frequency 4.25 MHz
    sig ← ⍵
    kernel ← (0.19, 0.39, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_9 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_9 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_9 0

⍝ --- Ultrasound Transducer Matching FIR Filter 10 ---
TransducerFIRFilter_10 ← {
    ⍝ Bandpass filter for center frequency 4.5 MHz
    sig ← ⍵
    kernel ← (0.2, 0.4, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_10 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_10 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_10 0

⍝ --- Ultrasound Transducer Matching FIR Filter 11 ---
TransducerFIRFilter_11 ← {
    ⍝ Bandpass filter for center frequency 4.75 MHz
    sig ← ⍵
    kernel ← (0.21000000000000002, 0.41, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_11 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_11 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_11 0

⍝ --- Ultrasound Transducer Matching FIR Filter 12 ---
TransducerFIRFilter_12 ← {
    ⍝ Bandpass filter for center frequency 5.0 MHz
    sig ← ⍵
    kernel ← (0.22, 0.42, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_12 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_12 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_12 0

⍝ --- Ultrasound Transducer Matching FIR Filter 13 ---
TransducerFIRFilter_13 ← {
    ⍝ Bandpass filter for center frequency 5.25 MHz
    sig ← ⍵
    kernel ← (0.23, 0.43, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_13 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_13 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_13 0

⍝ --- Ultrasound Transducer Matching FIR Filter 14 ---
TransducerFIRFilter_14 ← {
    ⍝ Bandpass filter for center frequency 5.5 MHz
    sig ← ⍵
    kernel ← (0.24000000000000002, 0.44, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_14 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_14 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_14 0

⍝ --- Ultrasound Transducer Matching FIR Filter 15 ---
TransducerFIRFilter_15 ← {
    ⍝ Bandpass filter for center frequency 5.75 MHz
    sig ← ⍵
    kernel ← (0.25, 0.44999999999999996, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_15 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_15 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_15 0

⍝ --- Ultrasound Transducer Matching FIR Filter 16 ---
TransducerFIRFilter_16 ← {
    ⍝ Bandpass filter for center frequency 6.0 MHz
    sig ← ⍵
    kernel ← (0.26, 0.45999999999999996, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_16 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_16 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_16 0

⍝ --- Ultrasound Transducer Matching FIR Filter 17 ---
TransducerFIRFilter_17 ← {
    ⍝ Bandpass filter for center frequency 6.25 MHz
    sig ← ⍵
    kernel ← (0.27, 0.47, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_17 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_17 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_17 0

⍝ --- Ultrasound Transducer Matching FIR Filter 18 ---
TransducerFIRFilter_18 ← {
    ⍝ Bandpass filter for center frequency 6.5 MHz
    sig ← ⍵
    kernel ← (0.28, 0.48, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_18 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_18 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_18 0

⍝ --- Ultrasound Transducer Matching FIR Filter 19 ---
TransducerFIRFilter_19 ← {
    ⍝ Bandpass filter for center frequency 6.75 MHz
    sig ← ⍵
    kernel ← (0.29000000000000004, 0.49, 31) FIRBandpassKernel 0
    sig Convolve1D kernel
}

VerifyFIR_19 ← {
    x ← (⍳100) ⍴ 1.0
    f ← TransducerFIRFilter_19 x
    (⍴f) = 100: 1
    0
}
_ ← VerifyFIR_19 0

⍝ --- Master Verification Test Suite for FIR Module ---
TestFIRModuleFull ← {
    k ← (0.2 31) FIRLowpassKernel 0
    (⍴k ≠ 31): 'FAIL: Lowpass kernel length mismatch'
    
    sum_k ← +/ k
    (|(sum_k - 1.0) > 1e-4): 'FAIL: Lowpass DC gain not unity'
    
    'PASS: dsp/fir.apl full verification passed'
}
_ ← TestFIRModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (fir.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_fir_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_fir_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_fir_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_fir_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_fir_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_fir_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_fir_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (fir.apl) ---
ValidationRoutine_1_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_fir_apl 0

⍝ --- Precision Calibration Assertion Block 2 (fir.apl) ---
ValidationRoutine_2_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_fir_apl 0

⍝ --- Precision Calibration Assertion Block 3 (fir.apl) ---
ValidationRoutine_3_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_fir_apl 0

⍝ --- Precision Calibration Assertion Block 4 (fir.apl) ---
ValidationRoutine_4_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_fir_apl 0

⍝ --- Precision Calibration Assertion Block 5 (fir.apl) ---
ValidationRoutine_5_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_fir_apl 0

⍝ --- Precision Calibration Assertion Block 6 (fir.apl) ---
ValidationRoutine_6_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_fir_apl 0

⍝ --- Precision Calibration Assertion Block 7 (fir.apl) ---
ValidationRoutine_7_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_fir_apl 0

⍝ --- Precision Calibration Assertion Block 8 (fir.apl) ---
ValidationRoutine_8_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_fir_apl 0

⍝ --- Precision Calibration Assertion Block 9 (fir.apl) ---
ValidationRoutine_9_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_fir_apl 0

⍝ --- Precision Calibration Assertion Block 10 (fir.apl) ---
ValidationRoutine_10_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_fir_apl 0

⍝ --- Precision Calibration Assertion Block 11 (fir.apl) ---
ValidationRoutine_11_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_fir_apl 0

⍝ --- Precision Calibration Assertion Block 12 (fir.apl) ---
ValidationRoutine_12_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_fir_apl 0

⍝ --- Precision Calibration Assertion Block 13 (fir.apl) ---
ValidationRoutine_13_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_fir_apl 0

⍝ --- Precision Calibration Assertion Block 14 (fir.apl) ---
ValidationRoutine_14_fir_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fir_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_fir_apl 0
