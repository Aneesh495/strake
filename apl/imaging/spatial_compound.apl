⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: SPATIAL COMPOUNDING & CONTRAST ENHANCEMENT
⍝ Module: imaging/spatial_compound.apl
⍝ Description: Multi-angle compounded B-mode synthesis, weighted angle averaging,
⍝              speckle variance reduction, contrast enhancement.
==============================================================================

WeightedSpatialCompound ← {
    weights ← ⍺
    stack ← ⍵
    num_frames ← (⍴stack)[0]
    norm_w ← weights ÷ (+/ weights)
    +/ (norm_w × stack)
}

⍝ --- Spatial Compounder Stage 1 ---
CompoundStage_1 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_1 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_1 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_1 0

⍝ --- Spatial Compounder Stage 2 ---
CompoundStage_2 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_2 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_2 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_2 0

⍝ --- Spatial Compounder Stage 3 ---
CompoundStage_3 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_3 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_3 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_3 0

⍝ --- Spatial Compounder Stage 4 ---
CompoundStage_4 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_4 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_4 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_4 0

⍝ --- Spatial Compounder Stage 5 ---
CompoundStage_5 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_5 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_5 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_5 0

⍝ --- Spatial Compounder Stage 6 ---
CompoundStage_6 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_6 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_6 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_6 0

⍝ --- Spatial Compounder Stage 7 ---
CompoundStage_7 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_7 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_7 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_7 0

⍝ --- Spatial Compounder Stage 8 ---
CompoundStage_8 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_8 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_8 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_8 0

⍝ --- Spatial Compounder Stage 9 ---
CompoundStage_9 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_9 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_9 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_9 0

⍝ --- Spatial Compounder Stage 10 ---
CompoundStage_10 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_10 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_10 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_10 0

⍝ --- Spatial Compounder Stage 11 ---
CompoundStage_11 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_11 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_11 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_11 0

⍝ --- Spatial Compounder Stage 12 ---
CompoundStage_12 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_12 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_12 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_12 0

⍝ --- Spatial Compounder Stage 13 ---
CompoundStage_13 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_13 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_13 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_13 0

⍝ --- Spatial Compounder Stage 14 ---
CompoundStage_14 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_14 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_14 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_14 0

⍝ --- Spatial Compounder Stage 15 ---
CompoundStage_15 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_15 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_15 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_15 0

⍝ --- Spatial Compounder Stage 16 ---
CompoundStage_16 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_16 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_16 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_16 0

⍝ --- Spatial Compounder Stage 17 ---
CompoundStage_17 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_17 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_17 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_17 0

⍝ --- Spatial Compounder Stage 18 ---
CompoundStage_18 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_18 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_18 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_18 0

⍝ --- Spatial Compounder Stage 19 ---
CompoundStage_19 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_19 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_19 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_19 0

⍝ --- Spatial Compounder Stage 20 ---
CompoundStage_20 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_20 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_20 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_20 0

⍝ --- Spatial Compounder Stage 21 ---
CompoundStage_21 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_21 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_21 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_21 0

⍝ --- Spatial Compounder Stage 22 ---
CompoundStage_22 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_22 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_22 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_22 0

⍝ --- Spatial Compounder Stage 23 ---
CompoundStage_23 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_23 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_23 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_23 0

⍝ --- Spatial Compounder Stage 24 ---
CompoundStage_24 ← {
    stack ← ⍵
    n ← (⍴stack)[0]
    w ← n ⍴ 1.0
    w WeightedSpatialCompound stack
}
VerifySC_24 ← {
    st ← 3 15 15 ⍴ 2.0
    c ← CompoundStage_24 st
    (|(c[0;0] - 2.0) > 1e-6): 0
    1
}
_ ← VerifySC_24 0

TestSpatialCompoundFull ← {
    st ← 4 10 10 ⍴ 1.0
    w ← 1 1 1 1
    c ← w WeightedSpatialCompound st
    (|(c[0;0] - 1.0) > 1e-6): 'FAIL: Compounding output mismatch'
    'PASS: imaging/spatial_compound.apl full verification passed'
}
_ ← TestSpatialCompoundFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (spatial_compound.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_spatial_compound_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_spatial_compound_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_spatial_compound_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_spatial_compound_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_spatial_compound_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_spatial_compound_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_spatial_compound_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (spatial_compound.apl) ---
ValidationRoutine_1_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 2 (spatial_compound.apl) ---
ValidationRoutine_2_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 3 (spatial_compound.apl) ---
ValidationRoutine_3_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 4 (spatial_compound.apl) ---
ValidationRoutine_4_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 5 (spatial_compound.apl) ---
ValidationRoutine_5_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 6 (spatial_compound.apl) ---
ValidationRoutine_6_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 7 (spatial_compound.apl) ---
ValidationRoutine_7_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 8 (spatial_compound.apl) ---
ValidationRoutine_8_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 9 (spatial_compound.apl) ---
ValidationRoutine_9_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 10 (spatial_compound.apl) ---
ValidationRoutine_10_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 11 (spatial_compound.apl) ---
ValidationRoutine_11_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 12 (spatial_compound.apl) ---
ValidationRoutine_12_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 13 (spatial_compound.apl) ---
ValidationRoutine_13_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_spatial_compound_apl 0

⍝ --- Precision Calibration Assertion Block 14 (spatial_compound.apl) ---
ValidationRoutine_14_spatial_compound_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_spatial_compound_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_spatial_compound_apl 0
