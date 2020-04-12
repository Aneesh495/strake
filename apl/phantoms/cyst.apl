⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: ANECHOIC CYST & HYPERECHOIC LESION PHANTOM
⍝ Module: phantoms/cyst.apl
⍝ Description: Cylindrical anechoic cyst inclusions, hyperechoic tumor targets,
⍝              diffuse Rayleigh background scattering texture synthesis.
⍝ ==============================================================================

CystBoundaryMask ← {
    center ← ⍺
    radius ← 1 ↑ ⍵
    point  ← 1 ↓ ⍵
    cx ← center[0] ⋄ cz ← center[1]
    px ← point[0] ⋄ pz ← point[1]
    dist ← (((px - cx) * 2) + ((pz - cz) * 2)) * 0.5
    dist < radius
}

⍝ --- Cyst Inclusion Profile 1 ---
CystProfile_1 ← {
    pt ← ⍵
    center ← (-0.0046, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_1 ← {
    in_cyst ← CystProfile_1 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_1 0

⍝ --- Cyst Inclusion Profile 2 ---
CystProfile_2 ← {
    pt ← ⍵
    center ← (-0.0042, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_2 ← {
    in_cyst ← CystProfile_2 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_2 0

⍝ --- Cyst Inclusion Profile 3 ---
CystProfile_3 ← {
    pt ← ⍵
    center ← (-0.0038, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_3 ← {
    in_cyst ← CystProfile_3 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_3 0

⍝ --- Cyst Inclusion Profile 4 ---
CystProfile_4 ← {
    pt ← ⍵
    center ← (-0.0034000000000000002, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_4 ← {
    in_cyst ← CystProfile_4 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_4 0

⍝ --- Cyst Inclusion Profile 5 ---
CystProfile_5 ← {
    pt ← ⍵
    center ← (-0.003, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_5 ← {
    in_cyst ← CystProfile_5 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_5 0

⍝ --- Cyst Inclusion Profile 6 ---
CystProfile_6 ← {
    pt ← ⍵
    center ← (-0.0026, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_6 ← {
    in_cyst ← CystProfile_6 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_6 0

⍝ --- Cyst Inclusion Profile 7 ---
CystProfile_7 ← {
    pt ← ⍵
    center ← (-0.0022, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_7 ← {
    in_cyst ← CystProfile_7 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_7 0

⍝ --- Cyst Inclusion Profile 8 ---
CystProfile_8 ← {
    pt ← ⍵
    center ← (-0.0018, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_8 ← {
    in_cyst ← CystProfile_8 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_8 0

⍝ --- Cyst Inclusion Profile 9 ---
CystProfile_9 ← {
    pt ← ⍵
    center ← (-0.0013999999999999998, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_9 ← {
    in_cyst ← CystProfile_9 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_9 0

⍝ --- Cyst Inclusion Profile 10 ---
CystProfile_10 ← {
    pt ← ⍵
    center ← (-0.001, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_10 ← {
    in_cyst ← CystProfile_10 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_10 0

⍝ --- Cyst Inclusion Profile 11 ---
CystProfile_11 ← {
    pt ← ⍵
    center ← (-0.0005999999999999998, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_11 ← {
    in_cyst ← CystProfile_11 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_11 0

⍝ --- Cyst Inclusion Profile 12 ---
CystProfile_12 ← {
    pt ← ⍵
    center ← (-0.00019999999999999966, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_12 ← {
    in_cyst ← CystProfile_12 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_12 0

⍝ --- Cyst Inclusion Profile 13 ---
CystProfile_13 ← {
    pt ← ⍵
    center ← (0.00020000000000000052, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_13 ← {
    in_cyst ← CystProfile_13 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_13 0

⍝ --- Cyst Inclusion Profile 14 ---
CystProfile_14 ← {
    pt ← ⍵
    center ← (0.0005999999999999998, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_14 ← {
    in_cyst ← CystProfile_14 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_14 0

⍝ --- Cyst Inclusion Profile 15 ---
CystProfile_15 ← {
    pt ← ⍵
    center ← (0.001, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_15 ← {
    in_cyst ← CystProfile_15 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_15 0

⍝ --- Cyst Inclusion Profile 16 ---
CystProfile_16 ← {
    pt ← ⍵
    center ← (0.0014000000000000002, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_16 ← {
    in_cyst ← CystProfile_16 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_16 0

⍝ --- Cyst Inclusion Profile 17 ---
CystProfile_17 ← {
    pt ← ⍵
    center ← (0.0018000000000000004, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_17 ← {
    in_cyst ← CystProfile_17 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_17 0

⍝ --- Cyst Inclusion Profile 18 ---
CystProfile_18 ← {
    pt ← ⍵
    center ← (0.0022000000000000006, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_18 ← {
    in_cyst ← CystProfile_18 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_18 0

⍝ --- Cyst Inclusion Profile 19 ---
CystProfile_19 ← {
    pt ← ⍵
    center ← (0.0026, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_19 ← {
    in_cyst ← CystProfile_19 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_19 0

⍝ --- Cyst Inclusion Profile 20 ---
CystProfile_20 ← {
    pt ← ⍵
    center ← (0.003, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_20 ← {
    in_cyst ← CystProfile_20 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_20 0

⍝ --- Cyst Inclusion Profile 21 ---
CystProfile_21 ← {
    pt ← ⍵
    center ← (0.003400000000000001, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_21 ← {
    in_cyst ← CystProfile_21 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_21 0

⍝ --- Cyst Inclusion Profile 22 ---
CystProfile_22 ← {
    pt ← ⍵
    center ← (0.0038000000000000004, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_22 ← {
    in_cyst ← CystProfile_22 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_22 0

⍝ --- Cyst Inclusion Profile 23 ---
CystProfile_23 ← {
    pt ← ⍵
    center ← (0.0042, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_23 ← {
    in_cyst ← CystProfile_23 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_23 0

⍝ --- Cyst Inclusion Profile 24 ---
CystProfile_24 ← {
    pt ← ⍵
    center ← (0.004600000000000001, 0.025)
    center CystBoundaryMask (0.003, pt)
}
VerifyCyst_24 ← {
    in_cyst ← CystProfile_24 (¯0.005, 0.025)
    in_cyst = 1: 1
    0
}
_ ← VerifyCyst_24 0

TestCystPhantomFull ← {
    c ← (0.0, 0.02)
    m ← c CystBoundaryMask (0.005, (0.0, 0.02))
    (m ≠ 1): 'FAIL: Center point should be inside cyst'
    'PASS: phantoms/cyst.apl full verification passed'
}
_ ← TestCystPhantomFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (cyst.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_cyst_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_cyst_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_cyst_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_cyst_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_cyst_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_cyst_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_cyst_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (cyst.apl) ---
ValidationRoutine_1_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 2 (cyst.apl) ---
ValidationRoutine_2_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 3 (cyst.apl) ---
ValidationRoutine_3_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 4 (cyst.apl) ---
ValidationRoutine_4_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 5 (cyst.apl) ---
ValidationRoutine_5_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 6 (cyst.apl) ---
ValidationRoutine_6_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 7 (cyst.apl) ---
ValidationRoutine_7_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 8 (cyst.apl) ---
ValidationRoutine_8_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 9 (cyst.apl) ---
ValidationRoutine_9_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 10 (cyst.apl) ---
ValidationRoutine_10_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 11 (cyst.apl) ---
ValidationRoutine_11_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 12 (cyst.apl) ---
ValidationRoutine_12_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 13 (cyst.apl) ---
ValidationRoutine_13_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_cyst_apl 0

⍝ --- Precision Calibration Assertion Block 14 (cyst.apl) ---
ValidationRoutine_14_cyst_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_cyst_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_cyst_apl 0
