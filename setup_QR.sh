#!/bin/bash
set -e  # exit if any command fails

# move to repo root (directory where script is located)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/code/tensornetwork"
BUILD_DIR="$SRC_DIR/build"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

cmake "$SRC_DIR"
make -j$(nproc)