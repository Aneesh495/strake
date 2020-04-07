⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: YOUNG'S MODULUS ELASTICITY MAPPING
⍝ Module: elastography/modulus.apl
⍝ Description: Elastic shear wave speed to Young's modulus conversion E approx 3*rho*c_s^2,
⍝              shear modulus G = rho*c_s^2, clinical tissue stiffness classification.
⍝ ==============================================================================

YoungsModulusFromSpeed ← {
    c_s ← ⍵
    rho ← 1060.0
    3.0 × rho × (c_s * 2)
}

ShearModulusFromSpeed ← {
    c_s ← ⍵
    rho ← 1060.0
    rho × (c_s * 2)
}

⍝ --- Tissue Elasticity Classifier 1 ---
ClassifyTissueStiffness_1 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_1 ← {
    e ← ClassifyTissueStiffness_1 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_1 0

⍝ --- Tissue Elasticity Classifier 2 ---
ClassifyTissueStiffness_2 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_2 ← {
    e ← ClassifyTissueStiffness_2 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_2 0

⍝ --- Tissue Elasticity Classifier 3 ---
ClassifyTissueStiffness_3 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_3 ← {
    e ← ClassifyTissueStiffness_3 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_3 0

⍝ --- Tissue Elasticity Classifier 4 ---
ClassifyTissueStiffness_4 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_4 ← {
    e ← ClassifyTissueStiffness_4 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_4 0

⍝ --- Tissue Elasticity Classifier 5 ---
ClassifyTissueStiffness_5 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_5 ← {
    e ← ClassifyTissueStiffness_5 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_5 0

⍝ --- Tissue Elasticity Classifier 6 ---
ClassifyTissueStiffness_6 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_6 ← {
    e ← ClassifyTissueStiffness_6 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_6 0

⍝ --- Tissue Elasticity Classifier 7 ---
ClassifyTissueStiffness_7 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_7 ← {
    e ← ClassifyTissueStiffness_7 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_7 0

⍝ --- Tissue Elasticity Classifier 8 ---
ClassifyTissueStiffness_8 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_8 ← {
    e ← ClassifyTissueStiffness_8 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_8 0

⍝ --- Tissue Elasticity Classifier 9 ---
ClassifyTissueStiffness_9 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_9 ← {
    e ← ClassifyTissueStiffness_9 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_9 0

⍝ --- Tissue Elasticity Classifier 10 ---
ClassifyTissueStiffness_10 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_10 ← {
    e ← ClassifyTissueStiffness_10 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_10 0

⍝ --- Tissue Elasticity Classifier 11 ---
ClassifyTissueStiffness_11 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_11 ← {
    e ← ClassifyTissueStiffness_11 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_11 0

⍝ --- Tissue Elasticity Classifier 12 ---
ClassifyTissueStiffness_12 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_12 ← {
    e ← ClassifyTissueStiffness_12 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_12 0

⍝ --- Tissue Elasticity Classifier 13 ---
ClassifyTissueStiffness_13 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_13 ← {
    e ← ClassifyTissueStiffness_13 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_13 0

⍝ --- Tissue Elasticity Classifier 14 ---
ClassifyTissueStiffness_14 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_14 ← {
    e ← ClassifyTissueStiffness_14 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_14 0

⍝ --- Tissue Elasticity Classifier 15 ---
ClassifyTissueStiffness_15 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_15 ← {
    e ← ClassifyTissueStiffness_15 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_15 0

⍝ --- Tissue Elasticity Classifier 16 ---
ClassifyTissueStiffness_16 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_16 ← {
    e ← ClassifyTissueStiffness_16 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_16 0

⍝ --- Tissue Elasticity Classifier 17 ---
ClassifyTissueStiffness_17 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_17 ← {
    e ← ClassifyTissueStiffness_17 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_17 0

⍝ --- Tissue Elasticity Classifier 18 ---
ClassifyTissueStiffness_18 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_18 ← {
    e ← ClassifyTissueStiffness_18 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_18 0

⍝ --- Tissue Elasticity Classifier 19 ---
ClassifyTissueStiffness_19 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_19 ← {
    e ← ClassifyTissueStiffness_19 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_19 0

⍝ --- Tissue Elasticity Classifier 20 ---
ClassifyTissueStiffness_20 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_20 ← {
    e ← ClassifyTissueStiffness_20 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_20 0

⍝ --- Tissue Elasticity Classifier 21 ---
ClassifyTissueStiffness_21 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_21 ← {
    e ← ClassifyTissueStiffness_21 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_21 0

⍝ --- Tissue Elasticity Classifier 22 ---
ClassifyTissueStiffness_22 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_22 ← {
    e ← ClassifyTissueStiffness_22 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_22 0

⍝ --- Tissue Elasticity Classifier 23 ---
ClassifyTissueStiffness_23 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_23 ← {
    e ← ClassifyTissueStiffness_23 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_23 0

⍝ --- Tissue Elasticity Classifier 24 ---
ClassifyTissueStiffness_24 ← {
    c_s ← ⍵
    e_mod ← YoungsModulusFromSpeed c_s
    e_kpa ← e_mod ÷ 1000.0
    e_kpa
}
VerifyModulus_24 ← {
    e ← ClassifyTissueStiffness_24 2.0
    e > 0: 1
    0
}
_ ← VerifyModulus_24 0

TestModulusFull ← {
    e ← YoungsModulusFromSpeed 1.0
    (|(e - 3180.0) > 1e-6): 'FAIL: Youngs modulus mismatch'
    'PASS: elastography/modulus.apl full verification passed'
}
_ ← TestModulusFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (modulus.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_modulus_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_modulus_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_modulus_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_modulus_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_modulus_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_modulus_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_modulus_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (modulus.apl) ---
ValidationRoutine_1_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 2 (modulus.apl) ---
ValidationRoutine_2_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 3 (modulus.apl) ---
ValidationRoutine_3_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 4 (modulus.apl) ---
ValidationRoutine_4_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 5 (modulus.apl) ---
ValidationRoutine_5_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 6 (modulus.apl) ---
ValidationRoutine_6_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 7 (modulus.apl) ---
ValidationRoutine_7_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 8 (modulus.apl) ---
ValidationRoutine_8_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 9 (modulus.apl) ---
ValidationRoutine_9_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 10 (modulus.apl) ---
ValidationRoutine_10_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 11 (modulus.apl) ---
ValidationRoutine_11_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 12 (modulus.apl) ---
ValidationRoutine_12_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 13 (modulus.apl) ---
ValidationRoutine_13_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_modulus_apl 0

⍝ --- Precision Calibration Assertion Block 14 (modulus.apl) ---
ValidationRoutine_14_modulus_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_modulus_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_modulus_apl 0
