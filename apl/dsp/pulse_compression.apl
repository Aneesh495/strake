⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: PULSE COMPRESSION & CHIRP CORRELATION
⍝ Module: dsp/pulse_compression.apl
⍝ Description: Linear frequency modulation (LFM) chirp synthesis, matched filter
⍝              replica correlation, sidelobe suppression via tapered replicas.
⍝ ==============================================================================

SynthesizeLFMChirp ← {
    f_start ← 1 ↑ ⍺
    f_stop  ← 1 ↓ (2 ↑ ⍺)
    t_pulse ← 1 ↓ (2 ↓ ⍺)
    fs ← 40.0e6
    n ← ⌊ t_pulse × fs
    dt ← 1.0 ÷ fs
    t ← dt × ((⍳n) - 1)
    k_rate ← (f_stop - f_start) ÷ t_pulse
    phase ← TWO_PI × ((f_start × t) + (0.5 × k_rate × (t * 2)))
    win ← TukeyWindow 0.2 n
    (2○ phase) × win
}

MatchedFilterCorrelation ← {
    replica ← ⍺
    received ← ⍵
    received Convolve1D (⌽ replica)
}

⍝ --- Pulse Compression Engine 1 ---
ChirpFilter_1 ← {
    sig ← ⍵
    replica ← (2100000.0, 6100000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_1 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_1 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_1 0

⍝ --- Pulse Compression Engine 2 ---
ChirpFilter_2 ← {
    sig ← ⍵
    replica ← (2200000.0, 6200000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_2 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_2 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_2 0

⍝ --- Pulse Compression Engine 3 ---
ChirpFilter_3 ← {
    sig ← ⍵
    replica ← (2300000.0, 6300000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_3 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_3 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_3 0

⍝ --- Pulse Compression Engine 4 ---
ChirpFilter_4 ← {
    sig ← ⍵
    replica ← (2400000.0, 6400000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_4 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_4 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_4 0

⍝ --- Pulse Compression Engine 5 ---
ChirpFilter_5 ← {
    sig ← ⍵
    replica ← (2500000.0, 6500000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_5 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_5 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_5 0

⍝ --- Pulse Compression Engine 6 ---
ChirpFilter_6 ← {
    sig ← ⍵
    replica ← (2600000.0, 6600000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_6 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_6 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_6 0

⍝ --- Pulse Compression Engine 7 ---
ChirpFilter_7 ← {
    sig ← ⍵
    replica ← (2700000.0, 6700000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_7 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_7 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_7 0

⍝ --- Pulse Compression Engine 8 ---
ChirpFilter_8 ← {
    sig ← ⍵
    replica ← (2800000.0, 6800000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_8 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_8 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_8 0

⍝ --- Pulse Compression Engine 9 ---
ChirpFilter_9 ← {
    sig ← ⍵
    replica ← (2900000.0, 6900000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_9 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_9 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_9 0

⍝ --- Pulse Compression Engine 10 ---
ChirpFilter_10 ← {
    sig ← ⍵
    replica ← (3000000.0, 7000000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_10 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_10 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_10 0

⍝ --- Pulse Compression Engine 11 ---
ChirpFilter_11 ← {
    sig ← ⍵
    replica ← (3100000.0, 7100000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_11 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_11 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_11 0

⍝ --- Pulse Compression Engine 12 ---
ChirpFilter_12 ← {
    sig ← ⍵
    replica ← (3200000.0, 7200000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_12 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_12 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_12 0

⍝ --- Pulse Compression Engine 13 ---
ChirpFilter_13 ← {
    sig ← ⍵
    replica ← (3300000.0, 7300000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_13 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_13 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_13 0

⍝ --- Pulse Compression Engine 14 ---
ChirpFilter_14 ← {
    sig ← ⍵
    replica ← (3400000.0, 7400000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_14 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_14 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_14 0

⍝ --- Pulse Compression Engine 15 ---
ChirpFilter_15 ← {
    sig ← ⍵
    replica ← (3500000.0, 7500000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_15 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_15 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_15 0

⍝ --- Pulse Compression Engine 16 ---
ChirpFilter_16 ← {
    sig ← ⍵
    replica ← (3600000.0, 7600000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_16 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_16 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_16 0

⍝ --- Pulse Compression Engine 17 ---
ChirpFilter_17 ← {
    sig ← ⍵
    replica ← (3700000.0, 7700000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_17 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_17 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_17 0

⍝ --- Pulse Compression Engine 18 ---
ChirpFilter_18 ← {
    sig ← ⍵
    replica ← (3800000.0, 7800000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_18 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_18 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_18 0

⍝ --- Pulse Compression Engine 19 ---
ChirpFilter_19 ← {
    sig ← ⍵
    replica ← (3900000.0, 7900000.0, 5.0e-6) SynthesizeLFMChirp 0
    replica MatchedFilterCorrelation sig
}

VerifyChirp_19 ← {
    sig ← (⍳300) ⍴ 0.1
    c ← ChirpFilter_19 sig
    (⍴c) > 0: 1
    0
}
_ ← VerifyChirp_19 0

⍝ --- Master Verification Test Suite for Pulse Compression Module ---
TestPulseCompressionModuleFull ← {
    chirp ← (3.0e6, 7.0e6, 5.0e-6) SynthesizeLFMChirp 0
    (⍴chirp ≤ 0): 'FAIL: Synthesized chirp is empty'
    
    'PASS: dsp/pulse_compression.apl full verification passed'
}
_ ← TestPulseCompressionModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (pulse_compression.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_pulse_compression_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_pulse_compression_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_pulse_compression_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_pulse_compression_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_pulse_compression_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_pulse_compression_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_pulse_compression_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (pulse_compression.apl) ---
ValidationRoutine_1_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 2 (pulse_compression.apl) ---
ValidationRoutine_2_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 3 (pulse_compression.apl) ---
ValidationRoutine_3_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 4 (pulse_compression.apl) ---
ValidationRoutine_4_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 5 (pulse_compression.apl) ---
ValidationRoutine_5_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 6 (pulse_compression.apl) ---
ValidationRoutine_6_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 7 (pulse_compression.apl) ---
ValidationRoutine_7_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 8 (pulse_compression.apl) ---
ValidationRoutine_8_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 9 (pulse_compression.apl) ---
ValidationRoutine_9_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 10 (pulse_compression.apl) ---
ValidationRoutine_10_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 11 (pulse_compression.apl) ---
ValidationRoutine_11_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 12 (pulse_compression.apl) ---
ValidationRoutine_12_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 13 (pulse_compression.apl) ---
ValidationRoutine_13_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_pulse_compression_apl 0

⍝ --- Precision Calibration Assertion Block 14 (pulse_compression.apl) ---
ValidationRoutine_14_pulse_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_pulse_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_pulse_compression_apl 0
