# Acoustic Phased-Array Beamforming & Wavefield Physics

This document presents the theoretical foundations and mathematical derivations underlying Strake's acoustic beamforming engine.

---

## 1. Acoustic Wave Equation & Green's Function

Linear acoustic wave propagation in homogeneous, non-attenuating biological media is governed by the scalar wave equation:

$$\nabla^2 p(\mathbf{r}, t) - \frac{1}{c^2} \frac{\partial^2 p(\mathbf{r}, t)}{\partial t^2} = -s(\mathbf{r}, t)$$

where $p(\mathbf{r}, t)$ is acoustic pressure, $c$ is the longitudinal speed of sound ($c \approx 1540 \text{ m/s}$ in soft human tissue), and $s(\mathbf{r}, t)$ is the spatial source distribution.

For an acoustic point source located at $\mathbf{r}_0$ emitting an impulse $\delta(t)$, the free-space Green's function is:

$$G(\mathbf{r}, t \mid \mathbf{r}_0, 0) = \frac{\delta\left(t - \frac{\|\mathbf{r} - \mathbf{r}_0\|}{c}\right)}{4\pi \|\mathbf{r} - \mathbf{r}_0\|}$$

---

## 2. Delay-and-Sum (DAS) Formulation

For an array of $M$ transducer elements located at coordinates $\mathbf{x}_m = (x_m, 0)$, the two-way Euclidean time-of-flight to a focal point $\mathbf{r} = (x, z)$ on the imaging grid is:

$$\tau_m(x, z) = \tau_{tx}(x, z) + \tau_{rx, m}(x, z)$$

### 2.1 Steered Plane-Wave Transmit
When transmitting a plane wave at steering angle $\theta$:

$$\tau_{tx}(x, z) = \frac{x \sin \theta + z \cos \theta}{c}$$

### 2.2 Receive Delay
For receive element $m$ with position $x_m$:

$$\tau_{rx, m}(x, z) = \frac{\sqrt{(x - x_m)^2 + z^2}}{c}$$

The reconstructed beamformed RF signal at pixel $(x, z)$ is the apodized coherent sum:

$$S(x, z) = \sum_{m=1}^M w_m(x, z) \cdot s_m\left(\tau_m(x, z)\right)$$

where $w_m(x, z)$ is the dynamic receive apodization coefficient (e.g. Hanning window).

---

## 3. Total Focusing Method (TFM) with Full Matrix Capture (FMC)

In Full Matrix Capture (FMC), every element transmits sequentially while all elements receive in parallel, capturing an $M \times M \times N_{samples}$ data tensor.

The Total Focusing Method (TFM) synthesizes optimal dynamic focus at every voxel $(x, z)$:

$$I_{TFM}(x, z) = \sum_{tx=1}^M \sum_{rx=1}^M s_{tx, rx}\left(\frac{\sqrt{(x - x_{tx})^2 + z^2} + \sqrt{(x - x_{rx})^2 + z^2}}{c}\right)$$

---

## 4. Minimum Variance Distortionless Response (MVDR / Capon)

Standard DAS uses data-independent weights $w$, resulting in sidelobes and acoustic clutter. The MVDR adaptive beamformer calculates optimal weights $w$ by minimizing output power subject to a distortionless constraint in the look direction:

$$\min_{w} w^H R w \quad \text{subject to} \quad w^H a = 1$$

where $R = \mathbb{E}[x x^H]$ is the array spatial covariance matrix and $a = [1, 1, \dots, 1]^T$ is the steering vector.

Using the method of Lagrange multipliers, the solution is:

$$w = \frac{R^{-1} a}{a^H R^{-1} a}$$

To handle ill-conditioned sample covariance matrices, Strake applies diagonal loading:

$$R_{loaded} = R + \epsilon \cdot \frac{\text{tr}(R)}{M} \cdot I$$
