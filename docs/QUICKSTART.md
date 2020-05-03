# Strake Developer Quickstart Guide

This guide walks through building Strake, running preset ultrasound imaging pipelines, launching the interactive APL REPL, and authoring custom acoustic pipelines.

---

## 1. Prerequisites

- Rust (1.80 or higher): Ensure `cargo` and `rustc` are on your PATH.
- Python 3.8+ (optional, for verification harnesses and visualization scripts).

---

## 2. Compilation

Clone the repository and build the release binary:

```bash
git clone https://github.com/Aneesh495/strake.git
cd strake
cargo build --release
```

The compiled binary will be placed at `./target/release/strake`.

---

## 3. Running Built-In Pipelines

Strake includes pre-configured reference pipelines:

### 3.1 Cardiac Phased-Array Sector Scan
Simulates deep cardiac tissue with anechoic cysts, applies 5-angle plane-wave compounding, and renders an ASCII B-mode preview in the terminal:

```bash
./target/release/strake pipeline cardiac -o cardiac.pgm
```

### 3.2 Industrial NDT Weld Inspection
Runs a 64x64 Full Matrix Capture (FMC) simulation over calibrated wire target scatterers and reconstructs via Total Focusing Method (TFM):

```bash
./target/release/strake pipeline ndt -o ndt_weld.pgm
```

---

## 4. Interactive APL REPL

Launch the REPL:

```bash
./target/release/strake repl
```

Execute array operations directly:

```text
    A ← 1 2 3 4
    +/ A
10
    V ← 1 2 3
    V ∘.× V
Tensor(shape=[3, 3]) [1 2 3 2 4 6 3 6 9]
```

Type `:q` or `exit` to quit.

---

## 5. Verification Harness

To verify that all 62 APL modules, unit tests, and integration suites pass with zero errors:

```bash
./scripts/run_all_apl.sh
```
