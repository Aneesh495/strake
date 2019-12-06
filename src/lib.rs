//! Strake: Acoustic Phased-Array Beamforming and Synthetic Aperture Workstation.
//!
//! High-performance array-native processing fabric driven by multidimensional
//! APL tensor pipelines.

pub mod tensor;
pub mod apl;
pub mod dsp;
pub mod beamformer;
pub mod doppler;
pub mod phantom;
pub mod render;
pub mod bench;

pub use tensor::{Tensor, TensorData};
pub use apl::eval_apl;
