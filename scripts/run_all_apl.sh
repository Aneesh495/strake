#!/usr/bin/env bash
# Strake Shell Verification Runner

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== Running Strake Test Suite ==="
cd "$ROOT_DIR"

cargo test --all --quiet

echo "=== Running Python Verification Harness ==="
python3 "$SCRIPT_DIR/verify_outputs.py"

echo "=== Verification Successful ==="
