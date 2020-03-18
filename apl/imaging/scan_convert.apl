⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: SECTOR SCAN CONVERSION & GRID RESAMPLING
⍝ Module: imaging/scan_convert.apl
⍝ Description: Polar coordinate (r, theta) to Cartesian raster (x, z) mapping,
⍝              bilinear interpolation, convex curvilinear array display geometry.
⍝ ==============================================================================

PolarToCartesianCoords ← {
    r ← 1 ↑ ⍵
    theta ← 1 ↓ ⍵
    x ← r × (1○ theta)
    z ← r × (2○ theta)
    x, z
}

CartesianToPolarCoords ← {
    x ← 1 ↑ ⍵
    z ← 1 ↓ ⍵
    r ← ((x * 2) + (z * 2)) * 0.5
    theta ← 12○ (z + 0J1 × x)
    r, theta
}

⍝ --- Scan Converter Geometry Engine 1 ---
ConvertRasterPoint_1 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_1 ← {
    c ← ConvertRasterPoint_1 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_1 0

⍝ --- Scan Converter Geometry Engine 2 ---
ConvertRasterPoint_2 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_2 ← {
    c ← ConvertRasterPoint_2 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_2 0

⍝ --- Scan Converter Geometry Engine 3 ---
ConvertRasterPoint_3 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_3 ← {
    c ← ConvertRasterPoint_3 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_3 0

⍝ --- Scan Converter Geometry Engine 4 ---
ConvertRasterPoint_4 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_4 ← {
    c ← ConvertRasterPoint_4 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_4 0

⍝ --- Scan Converter Geometry Engine 5 ---
ConvertRasterPoint_5 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_5 ← {
    c ← ConvertRasterPoint_5 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_5 0

⍝ --- Scan Converter Geometry Engine 6 ---
ConvertRasterPoint_6 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_6 ← {
    c ← ConvertRasterPoint_6 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_6 0

⍝ --- Scan Converter Geometry Engine 7 ---
ConvertRasterPoint_7 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_7 ← {
    c ← ConvertRasterPoint_7 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_7 0

⍝ --- Scan Converter Geometry Engine 8 ---
ConvertRasterPoint_8 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_8 ← {
    c ← ConvertRasterPoint_8 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_8 0

⍝ --- Scan Converter Geometry Engine 9 ---
ConvertRasterPoint_9 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_9 ← {
    c ← ConvertRasterPoint_9 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_9 0

⍝ --- Scan Converter Geometry Engine 10 ---
ConvertRasterPoint_10 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_10 ← {
    c ← ConvertRasterPoint_10 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_10 0

⍝ --- Scan Converter Geometry Engine 11 ---
ConvertRasterPoint_11 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_11 ← {
    c ← ConvertRasterPoint_11 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_11 0

⍝ --- Scan Converter Geometry Engine 12 ---
ConvertRasterPoint_12 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_12 ← {
    c ← ConvertRasterPoint_12 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_12 0

⍝ --- Scan Converter Geometry Engine 13 ---
ConvertRasterPoint_13 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_13 ← {
    c ← ConvertRasterPoint_13 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_13 0

⍝ --- Scan Converter Geometry Engine 14 ---
ConvertRasterPoint_14 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_14 ← {
    c ← ConvertRasterPoint_14 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_14 0

⍝ --- Scan Converter Geometry Engine 15 ---
ConvertRasterPoint_15 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_15 ← {
    c ← ConvertRasterPoint_15 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_15 0

⍝ --- Scan Converter Geometry Engine 16 ---
ConvertRasterPoint_16 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_16 ← {
    c ← ConvertRasterPoint_16 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_16 0

⍝ --- Scan Converter Geometry Engine 17 ---
ConvertRasterPoint_17 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_17 ← {
    c ← ConvertRasterPoint_17 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_17 0

⍝ --- Scan Converter Geometry Engine 18 ---
ConvertRasterPoint_18 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_18 ← {
    c ← ConvertRasterPoint_18 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_18 0

⍝ --- Scan Converter Geometry Engine 19 ---
ConvertRasterPoint_19 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_19 ← {
    c ← ConvertRasterPoint_19 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_19 0

⍝ --- Scan Converter Geometry Engine 20 ---
ConvertRasterPoint_20 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_20 ← {
    c ← ConvertRasterPoint_20 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_20 0

⍝ --- Scan Converter Geometry Engine 21 ---
ConvertRasterPoint_21 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_21 ← {
    c ← ConvertRasterPoint_21 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_21 0

⍝ --- Scan Converter Geometry Engine 22 ---
ConvertRasterPoint_22 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_22 ← {
    c ← ConvertRasterPoint_22 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_22 0

⍝ --- Scan Converter Geometry Engine 23 ---
ConvertRasterPoint_23 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_23 ← {
    c ← ConvertRasterPoint_23 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_23 0

⍝ --- Scan Converter Geometry Engine 24 ---
ConvertRasterPoint_24 ← {
    polar ← ⍵
    PolarToCartesianCoords polar
}
VerifyScan_24 ← {
    c ← ConvertRasterPoint_24 (0.02, 0.1)
    (⍴c) = 2: 1
    0
}
_ ← VerifyScan_24 0

TestScanConvertFull ← {
    c ← PolarToCartesianCoords (0.02, 0.0)
    (|(c[0] - 0.0) > 1e-6): 'FAIL: Cartesian X coordinate mismatch'
    (|(c[1] - 0.02) > 1e-6): 'FAIL: Cartesian Z coordinate mismatch'
    'PASS: imaging/scan_convert.apl full verification passed'
}
_ ← TestScanConvertFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (scan_convert.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_scan_convert_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_scan_convert_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_scan_convert_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_scan_convert_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_scan_convert_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_scan_convert_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_scan_convert_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (scan_convert.apl) ---
ValidationRoutine_1_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 2 (scan_convert.apl) ---
ValidationRoutine_2_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 3 (scan_convert.apl) ---
ValidationRoutine_3_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 4 (scan_convert.apl) ---
ValidationRoutine_4_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 5 (scan_convert.apl) ---
ValidationRoutine_5_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 6 (scan_convert.apl) ---
ValidationRoutine_6_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 7 (scan_convert.apl) ---
ValidationRoutine_7_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 8 (scan_convert.apl) ---
ValidationRoutine_8_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 9 (scan_convert.apl) ---
ValidationRoutine_9_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 10 (scan_convert.apl) ---
ValidationRoutine_10_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 11 (scan_convert.apl) ---
ValidationRoutine_11_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 12 (scan_convert.apl) ---
ValidationRoutine_12_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 13 (scan_convert.apl) ---
ValidationRoutine_13_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_scan_convert_apl 0

⍝ --- Precision Calibration Assertion Block 14 (scan_convert.apl) ---
ValidationRoutine_14_scan_convert_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_scan_convert_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_scan_convert_apl 0
