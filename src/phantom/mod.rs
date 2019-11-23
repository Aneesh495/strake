//! Acoustic tissue phantoms and wavefield simulation module.

pub mod scatterers;

pub use scatterers::{Scatterer, TissuePhantom, simulate_rf_plane_wave};
