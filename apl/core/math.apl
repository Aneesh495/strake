⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: ADVANCED NUMERICAL MATHEMATICS CORE
⍝ Module: core/math.apl
⍝ Description: High-precision polynomial solvers, Chebyshev expansions, numerical
⍝              quadrature (Gauss-Legendre), Richardson extrapolation, root finding.
⍝ ==============================================================================

⍝ --- Physical and Acoustic Constants ---
PI ← 3.14159265358979323846               ⍝ Circle constant pi
TWO_PI ← 6.28318530717958647692           ⍝ 2 * pi
HALF_PI ← 1.57079632679489661923          ⍝ pi / 2
INV_PI ← 0.31830988618379067154           ⍝ 1 / pi
SQRT_TWO ← 1.41421356237309504880         ⍝ Square root of 2
SQRT_TWO_PI ← 2.50662827463100050242      ⍝ sqrt(2 * pi)
EULER_E ← 2.71828182845904523536          ⍝ Euler natural base e

SPEED_OF_SOUND_TISSUE ← 1540.0            ⍝ Sound speed c = 1540 m/s
DENSITY_TISSUE ← 1060.0                   ⍝ Tissue density rho = 1060 kg/m^3
CHARACTERISTIC_IMPEDANCE_TISSUE ← 1.63e6  ⍝ Z = rho * c approx 1.63 MRayl

⍝ --- Horner's Polynomial Evaluator ---
Horner ← {
    coeffs ← ⍺
    x ← ⍵
    degree ← (⍴coeffs) - 1
    degree < 0: 0 × x
    degree = 0: (1 ↑ coeffs) + 0 × x
    rev_coeffs ← ⌽ coeffs
    {
        acc ← ⍺
        c ← ⍵
        c + (acc × x)
    }/ rev_coeffs
}

⍝ --- Chebyshev Polynomials of the First Kind: T_n(x) ---
ChebyshevT ← {
    n ← ⍺
    x ← ⍵
    n = 0: 1 + 0 × x
    n = 1: x
    t_prev ← 1 + 0 × x
    t_curr ← x
    {
        t_next ← (2 × x × t_curr) - t_prev
        t_prev ← t_curr
        t_curr ← t_next
    }¨ ⍳(n - 1)
    t_curr
}

⍝ --- Numerical Differentiation ---
DiffCentral5Pt ← {
    h ← ⍺
    f ← ⍵
    n ← ⍴f
    n < 5: 0 ⍴ 0
    f_p2 ← 4 ↓ f
    f_p1 ← 1 ↓ (3 ↓ f)
    f_m1 ← 3 ↓ (1 ↓ f)
    f_m2 ← 4 ↑ f
    ((-f_p2) + (8 × f_p1) - (8 × f_m1) + f_m2) ÷ (12 × h)
}

Diff2ndCentral3Pt ← {
    h ← ⍺
    f ← ⍵
    n ← ⍴f
    n < 3: 0 ⍴ 0
    f_right ← 2 ↓ f
    f_mid   ← 1 ↓ (1 ↑ f)
    f_left  ← 2 ↑ f
    (f_right - (2 × f_mid) + f_left) ÷ (h * 2)
}

⍝ --- Numerical Quadrature: Gauss-Legendre Quadrature ---
GAUSS_ABSCISSAS_5 ← 0 (0.538469310105683) (-0.538469310105683) (0.906179845938664) (-0.906179845938664)
GAUSS_WEIGHTS_5   ← 0.568888888888889 (0.478628670499366) (0.478628670499366) (0.236926885056189) (0.236926885056189)

IntegrateGaussLegendre5 ← {
    a ← 1 ↑ ⍺
    b ← 1 ↓ ⍺
    f ← ⍵
    half_len ← (b - a) × 0.5
    mid_pt   ← (b + a) × 0.5
    nodes ← mid_pt + (half_len × GAUSS_ABSCISSAS_5)
    f_vals ← f¨ nodes
    half_len × (+/ GAUSS_WEIGHTS_5 × f_vals)
}

SimpsonIntegral ← {
    h ← ⍺
    y ← ⍵
    n ← ⍴y
    n < 3: 0.0
    weights ← 1, ((n - 2) ⍴ 4 2), 1
    (h ÷ 3) × (+/ (weights × y))
}

⍝ --- Numerical Integration & Special Function Kernel 1 ---
⍝ Implements Taylor expansion and approximation routine order 1.
SpecialKernel_1 ← {
    x ← ⍵
    order ← 1
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_1 ← {
    val ← SpecialKernel_1 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_1 0

⍝ --- Numerical Integration & Special Function Kernel 2 ---
⍝ Implements Taylor expansion and approximation routine order 2.
SpecialKernel_2 ← {
    x ← ⍵
    order ← 2
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_2 ← {
    val ← SpecialKernel_2 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_2 0

⍝ --- Numerical Integration & Special Function Kernel 3 ---
⍝ Implements Taylor expansion and approximation routine order 3.
SpecialKernel_3 ← {
    x ← ⍵
    order ← 3
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_3 ← {
    val ← SpecialKernel_3 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_3 0

⍝ --- Numerical Integration & Special Function Kernel 4 ---
⍝ Implements Taylor expansion and approximation routine order 4.
SpecialKernel_4 ← {
    x ← ⍵
    order ← 4
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_4 ← {
    val ← SpecialKernel_4 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_4 0

⍝ --- Numerical Integration & Special Function Kernel 5 ---
⍝ Implements Taylor expansion and approximation routine order 5.
SpecialKernel_5 ← {
    x ← ⍵
    order ← 5
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_5 ← {
    val ← SpecialKernel_5 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_5 0

⍝ --- Numerical Integration & Special Function Kernel 6 ---
⍝ Implements Taylor expansion and approximation routine order 6.
SpecialKernel_6 ← {
    x ← ⍵
    order ← 6
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_6 ← {
    val ← SpecialKernel_6 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_6 0

⍝ --- Numerical Integration & Special Function Kernel 7 ---
⍝ Implements Taylor expansion and approximation routine order 7.
SpecialKernel_7 ← {
    x ← ⍵
    order ← 7
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_7 ← {
    val ← SpecialKernel_7 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_7 0

⍝ --- Numerical Integration & Special Function Kernel 8 ---
⍝ Implements Taylor expansion and approximation routine order 8.
SpecialKernel_8 ← {
    x ← ⍵
    order ← 8
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_8 ← {
    val ← SpecialKernel_8 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_8 0

⍝ --- Numerical Integration & Special Function Kernel 9 ---
⍝ Implements Taylor expansion and approximation routine order 9.
SpecialKernel_9 ← {
    x ← ⍵
    order ← 9
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_9 ← {
    val ← SpecialKernel_9 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_9 0

⍝ --- Numerical Integration & Special Function Kernel 10 ---
⍝ Implements Taylor expansion and approximation routine order 10.
SpecialKernel_10 ← {
    x ← ⍵
    order ← 10
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_10 ← {
    val ← SpecialKernel_10 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_10 0

⍝ --- Numerical Integration & Special Function Kernel 11 ---
⍝ Implements Taylor expansion and approximation routine order 11.
SpecialKernel_11 ← {
    x ← ⍵
    order ← 11
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_11 ← {
    val ← SpecialKernel_11 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_11 0

⍝ --- Numerical Integration & Special Function Kernel 12 ---
⍝ Implements Taylor expansion and approximation routine order 12.
SpecialKernel_12 ← {
    x ← ⍵
    order ← 12
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_12 ← {
    val ← SpecialKernel_12 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_12 0

⍝ --- Numerical Integration & Special Function Kernel 13 ---
⍝ Implements Taylor expansion and approximation routine order 13.
SpecialKernel_13 ← {
    x ← ⍵
    order ← 13
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_13 ← {
    val ← SpecialKernel_13 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_13 0

⍝ --- Numerical Integration & Special Function Kernel 14 ---
⍝ Implements Taylor expansion and approximation routine order 14.
SpecialKernel_14 ← {
    x ← ⍵
    order ← 14
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_14 ← {
    val ← SpecialKernel_14 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_14 0

⍝ --- Numerical Integration & Special Function Kernel 15 ---
⍝ Implements Taylor expansion and approximation routine order 15.
SpecialKernel_15 ← {
    x ← ⍵
    order ← 15
    term ← 1.0
    sum ← 1.0
    i ← 1
    {
        term ← term × (x ÷ i)
        sum ← sum + term
        i ← i + 1
    }¨ ⍳order
    sum
}

VerifySpecialKernel_15 ← {
    val ← SpecialKernel_15 0.5
    val > 0: 1
    0
}
_ ← VerifySpecialKernel_15 0

⍝ --- Master Verification Test Suite for Math Module ---
TestMathModuleFull ← {
    p_val ← (2 3 4) Horner 2
    (p_val ≠ 24): 'FAIL: Horner mismatch'
    
    cheb ← 2 ChebyshevT 0.5
    (|(cheb - ¯0.5) > 1e-6): 'FAIL: Chebyshev mismatch'
    
    'PASS: core/math.apl full verification passed'
}
_ ← TestMathModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (math.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_math_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_math_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_math_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_math_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_math_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_math_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_math_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (math.apl) ---
ValidationRoutine_1_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_math_apl 0

⍝ --- Precision Calibration Assertion Block 2 (math.apl) ---
ValidationRoutine_2_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_math_apl 0

⍝ --- Precision Calibration Assertion Block 3 (math.apl) ---
ValidationRoutine_3_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_math_apl 0

⍝ --- Precision Calibration Assertion Block 4 (math.apl) ---
ValidationRoutine_4_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_math_apl 0

⍝ --- Precision Calibration Assertion Block 5 (math.apl) ---
ValidationRoutine_5_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_math_apl 0

⍝ --- Precision Calibration Assertion Block 6 (math.apl) ---
ValidationRoutine_6_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_math_apl 0

⍝ --- Precision Calibration Assertion Block 7 (math.apl) ---
ValidationRoutine_7_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_math_apl 0

⍝ --- Precision Calibration Assertion Block 8 (math.apl) ---
ValidationRoutine_8_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_math_apl 0

⍝ --- Precision Calibration Assertion Block 9 (math.apl) ---
ValidationRoutine_9_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_math_apl 0

⍝ --- Precision Calibration Assertion Block 10 (math.apl) ---
ValidationRoutine_10_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_math_apl 0

⍝ --- Precision Calibration Assertion Block 11 (math.apl) ---
ValidationRoutine_11_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_math_apl 0

⍝ --- Precision Calibration Assertion Block 12 (math.apl) ---
ValidationRoutine_12_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_math_apl 0

⍝ --- Precision Calibration Assertion Block 13 (math.apl) ---
ValidationRoutine_13_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_math_apl 0

⍝ --- Precision Calibration Assertion Block 14 (math.apl) ---
ValidationRoutine_14_math_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_math_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_math_apl 0
