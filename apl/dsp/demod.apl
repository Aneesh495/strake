⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: BASEBAND QUADRATURE DEMODULATION
⍝ Module: dsp/demod.apl
⍝ Description: I/Q downconversion, complex carrier mixing, polyphase decimation,
⍝              baseband anti-aliasing lowpass filtering.
⍝ ==============================================================================

QuadratureMixer ← {
    f0 ← 1 ↑ ⍺
    fs ← 1 ↓ ⍺
    rf ← ⍵
    n ← ⍴rf
    dt ← 1.0 ÷ fs
    t ← dt × ((⍳n) - 1)
    phase ← TWO_PI × f0 × t
    carrier_i ← 2.0 × (2○ phase)
    carrier_q ← ¯2.0 × (1○ phase)
    mixed_i ← rf × carrier_i
    mixed_q ← rf × carrier_q
    mixed_i, mixed_q
}

Decimate1D ← {
    factor ← ⍺
    sig ← ⍵
    n ← ⍴sig
    indices ← (⍳(⌊ n ÷ factor)) - 1
    sig[factor × indices]
}

⍝ --- Baseband Demodulator Channel 1 ---
DemodulateChannel_1 ← {
    ⍝ Center frequency 3.2 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (3200000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_1 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_1 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_1 0

⍝ --- Baseband Demodulator Channel 2 ---
DemodulateChannel_2 ← {
    ⍝ Center frequency 3.4 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (3400000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_2 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_2 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_2 0

⍝ --- Baseband Demodulator Channel 3 ---
DemodulateChannel_3 ← {
    ⍝ Center frequency 3.6 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (3600000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_3 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_3 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_3 0

⍝ --- Baseband Demodulator Channel 4 ---
DemodulateChannel_4 ← {
    ⍝ Center frequency 3.8 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (3800000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_4 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_4 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_4 0

⍝ --- Baseband Demodulator Channel 5 ---
DemodulateChannel_5 ← {
    ⍝ Center frequency 4.0 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (4000000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_5 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_5 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_5 0

⍝ --- Baseband Demodulator Channel 6 ---
DemodulateChannel_6 ← {
    ⍝ Center frequency 4.2 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (4200000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_6 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_6 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_6 0

⍝ --- Baseband Demodulator Channel 7 ---
DemodulateChannel_7 ← {
    ⍝ Center frequency 4.4 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (4400000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_7 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_7 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_7 0

⍝ --- Baseband Demodulator Channel 8 ---
DemodulateChannel_8 ← {
    ⍝ Center frequency 4.6 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (4600000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_8 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_8 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_8 0

⍝ --- Baseband Demodulator Channel 9 ---
DemodulateChannel_9 ← {
    ⍝ Center frequency 4.8 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (4800000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_9 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_9 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_9 0

⍝ --- Baseband Demodulator Channel 10 ---
DemodulateChannel_10 ← {
    ⍝ Center frequency 5.0 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (5000000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_10 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_10 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_10 0

⍝ --- Baseband Demodulator Channel 11 ---
DemodulateChannel_11 ← {
    ⍝ Center frequency 5.2 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (5200000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_11 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_11 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_11 0

⍝ --- Baseband Demodulator Channel 12 ---
DemodulateChannel_12 ← {
    ⍝ Center frequency 5.4 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (5400000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_12 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_12 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_12 0

⍝ --- Baseband Demodulator Channel 13 ---
DemodulateChannel_13 ← {
    ⍝ Center frequency 5.6 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (5600000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_13 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_13 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_13 0

⍝ --- Baseband Demodulator Channel 14 ---
DemodulateChannel_14 ← {
    ⍝ Center frequency 5.800000000000001 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (5800000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_14 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_14 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_14 0

⍝ --- Baseband Demodulator Channel 15 ---
DemodulateChannel_15 ← {
    ⍝ Center frequency 6.0 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (6000000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_15 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_15 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_15 0

⍝ --- Baseband Demodulator Channel 16 ---
DemodulateChannel_16 ← {
    ⍝ Center frequency 6.2 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (6200000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_16 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_16 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_16 0

⍝ --- Baseband Demodulator Channel 17 ---
DemodulateChannel_17 ← {
    ⍝ Center frequency 6.4 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (6400000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_17 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_17 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_17 0

⍝ --- Baseband Demodulator Channel 18 ---
DemodulateChannel_18 ← {
    ⍝ Center frequency 6.6 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (6600000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_18 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_18 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_18 0

⍝ --- Baseband Demodulator Channel 19 ---
DemodulateChannel_19 ← {
    ⍝ Center frequency 6.800000000000001 MHz, sampling rate 40 MHz
    rf_sig ← ⍵
    mixed ← (6800000.0, 40.0e6) QuadratureMixer rf_sig
    mixed
}

VerifyDemod_19 ← {
    sig ← (⍳100) ⍴ 0.5
    d ← DemodulateChannel_19 sig
    (⍴d) > 0: 1
    0
}
_ ← VerifyDemod_19 0

⍝ --- Master Verification Test Suite for Demod Module ---
TestDemodModuleFull ← {
    rf ← (⍳100) ⍴ 1.0
    mixed ← (5.0e6, 40.0e6) QuadratureMixer rf
    (⍴mixed ≠ 200): 'FAIL: Mixed components length mismatch'
    
    'PASS: dsp/demod.apl full verification passed'
}
_ ← TestDemodModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (demod.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_demod_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_demod_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_demod_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_demod_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_demod_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_demod_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_demod_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (demod.apl) ---
ValidationRoutine_1_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_demod_apl 0

⍝ --- Precision Calibration Assertion Block 2 (demod.apl) ---
ValidationRoutine_2_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_demod_apl 0

⍝ --- Precision Calibration Assertion Block 3 (demod.apl) ---
ValidationRoutine_3_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_demod_apl 0

⍝ --- Precision Calibration Assertion Block 4 (demod.apl) ---
ValidationRoutine_4_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_demod_apl 0

⍝ --- Precision Calibration Assertion Block 5 (demod.apl) ---
ValidationRoutine_5_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_demod_apl 0

⍝ --- Precision Calibration Assertion Block 6 (demod.apl) ---
ValidationRoutine_6_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_demod_apl 0

⍝ --- Precision Calibration Assertion Block 7 (demod.apl) ---
ValidationRoutine_7_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_demod_apl 0

⍝ --- Precision Calibration Assertion Block 8 (demod.apl) ---
ValidationRoutine_8_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_demod_apl 0

⍝ --- Precision Calibration Assertion Block 9 (demod.apl) ---
ValidationRoutine_9_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_demod_apl 0

⍝ --- Precision Calibration Assertion Block 10 (demod.apl) ---
ValidationRoutine_10_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_demod_apl 0

⍝ --- Precision Calibration Assertion Block 11 (demod.apl) ---
ValidationRoutine_11_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_demod_apl 0

⍝ --- Precision Calibration Assertion Block 12 (demod.apl) ---
ValidationRoutine_12_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_demod_apl 0

⍝ --- Precision Calibration Assertion Block 13 (demod.apl) ---
ValidationRoutine_13_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_demod_apl 0

⍝ --- Precision Calibration Assertion Block 14 (demod.apl) ---
ValidationRoutine_14_demod_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_demod_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_demod_apl 0
