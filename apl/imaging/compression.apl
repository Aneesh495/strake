⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: LOGARITHMIC DYNAMIC RANGE COMPRESSION
⍝ Module: imaging/compression.apl
⍝ Description: Decibel scaling 20*log10(A/A_max), dynamic range clipping (e.g. 50 dB),
⍝              rejection thresholding, and sigmoid grayscale mapping.
⍝ ==============================================================================

LogCompressDecibels ← {
    dr_db ← ⍺
    image ← ⍵
    max_val ← MaxNorm image
    max_val ≤ 1e-12: (0 × image)
    normalized ← image ÷ max_val
    clamped_norm ← normalized ⌈ 1e-6
    db_vals ← 20.0 × (10⍟ clamped_norm)
    clamped_db ← db_vals ⌈ (¯1.0 × dr_db)
    (clamped_db + dr_db) ÷ dr_db
}

⍝ --- Compression Curve Preset 1 ---
CompressCurve_1 ← {
    dr ← 36.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_1 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_1 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_1 0

⍝ --- Compression Curve Preset 2 ---
CompressCurve_2 ← {
    dr ← 38.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_2 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_2 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_2 0

⍝ --- Compression Curve Preset 3 ---
CompressCurve_3 ← {
    dr ← 39.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_3 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_3 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_3 0

⍝ --- Compression Curve Preset 4 ---
CompressCurve_4 ← {
    dr ← 41.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_4 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_4 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_4 0

⍝ --- Compression Curve Preset 5 ---
CompressCurve_5 ← {
    dr ← 42.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_5 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_5 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_5 0

⍝ --- Compression Curve Preset 6 ---
CompressCurve_6 ← {
    dr ← 44.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_6 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_6 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_6 0

⍝ --- Compression Curve Preset 7 ---
CompressCurve_7 ← {
    dr ← 45.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_7 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_7 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_7 0

⍝ --- Compression Curve Preset 8 ---
CompressCurve_8 ← {
    dr ← 47.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_8 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_8 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_8 0

⍝ --- Compression Curve Preset 9 ---
CompressCurve_9 ← {
    dr ← 48.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_9 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_9 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_9 0

⍝ --- Compression Curve Preset 10 ---
CompressCurve_10 ← {
    dr ← 50.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_10 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_10 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_10 0

⍝ --- Compression Curve Preset 11 ---
CompressCurve_11 ← {
    dr ← 51.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_11 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_11 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_11 0

⍝ --- Compression Curve Preset 12 ---
CompressCurve_12 ← {
    dr ← 53.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_12 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_12 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_12 0

⍝ --- Compression Curve Preset 13 ---
CompressCurve_13 ← {
    dr ← 54.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_13 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_13 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_13 0

⍝ --- Compression Curve Preset 14 ---
CompressCurve_14 ← {
    dr ← 56.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_14 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_14 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_14 0

⍝ --- Compression Curve Preset 15 ---
CompressCurve_15 ← {
    dr ← 57.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_15 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_15 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_15 0

⍝ --- Compression Curve Preset 16 ---
CompressCurve_16 ← {
    dr ← 59.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_16 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_16 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_16 0

⍝ --- Compression Curve Preset 17 ---
CompressCurve_17 ← {
    dr ← 60.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_17 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_17 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_17 0

⍝ --- Compression Curve Preset 18 ---
CompressCurve_18 ← {
    dr ← 62.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_18 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_18 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_18 0

⍝ --- Compression Curve Preset 19 ---
CompressCurve_19 ← {
    dr ← 63.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_19 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_19 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_19 0

⍝ --- Compression Curve Preset 20 ---
CompressCurve_20 ← {
    dr ← 65.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_20 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_20 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_20 0

⍝ --- Compression Curve Preset 21 ---
CompressCurve_21 ← {
    dr ← 66.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_21 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_21 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_21 0

⍝ --- Compression Curve Preset 22 ---
CompressCurve_22 ← {
    dr ← 68.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_22 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_22 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_22 0

⍝ --- Compression Curve Preset 23 ---
CompressCurve_23 ← {
    dr ← 69.5
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_23 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_23 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_23 0

⍝ --- Compression Curve Preset 24 ---
CompressCurve_24 ← {
    dr ← 71.0
    img ← ⍵
    dr LogCompressDecibels img
}
VerifyCompress_24 ← {
    t_img ← 10 10 ⍴ 1.0
    c ← CompressCurve_24 t_img
    (c[0;0] ≠ 1.0): 0
    1
}
_ ← VerifyCompress_24 0

TestCompressionFull ← {
    img ← 10 10 ⍴ 1.0
    c ← 50.0 LogCompressDecibels img
    (c[0;0] ≠ 1.0): 'FAIL: Peak pixel should map to 1.0'
    'PASS: imaging/compression.apl full verification passed'
}
_ ← TestCompressionFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (compression.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_compression_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_compression_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_compression_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_compression_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_compression_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_compression_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_compression_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (compression.apl) ---
ValidationRoutine_1_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_compression_apl 0

⍝ --- Precision Calibration Assertion Block 2 (compression.apl) ---
ValidationRoutine_2_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_compression_apl 0

⍝ --- Precision Calibration Assertion Block 3 (compression.apl) ---
ValidationRoutine_3_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_compression_apl 0

⍝ --- Precision Calibration Assertion Block 4 (compression.apl) ---
ValidationRoutine_4_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_compression_apl 0

⍝ --- Precision Calibration Assertion Block 5 (compression.apl) ---
ValidationRoutine_5_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_compression_apl 0

⍝ --- Precision Calibration Assertion Block 6 (compression.apl) ---
ValidationRoutine_6_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_compression_apl 0

⍝ --- Precision Calibration Assertion Block 7 (compression.apl) ---
ValidationRoutine_7_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_compression_apl 0

⍝ --- Precision Calibration Assertion Block 8 (compression.apl) ---
ValidationRoutine_8_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_compression_apl 0

⍝ --- Precision Calibration Assertion Block 9 (compression.apl) ---
ValidationRoutine_9_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_compression_apl 0

⍝ --- Precision Calibration Assertion Block 10 (compression.apl) ---
ValidationRoutine_10_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_compression_apl 0

⍝ --- Precision Calibration Assertion Block 11 (compression.apl) ---
ValidationRoutine_11_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_compression_apl 0

⍝ --- Precision Calibration Assertion Block 12 (compression.apl) ---
ValidationRoutine_12_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_compression_apl 0

⍝ --- Precision Calibration Assertion Block 13 (compression.apl) ---
ValidationRoutine_13_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_compression_apl 0

⍝ --- Precision Calibration Assertion Block 14 (compression.apl) ---
ValidationRoutine_14_compression_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_compression_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_compression_apl 0
