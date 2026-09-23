#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUILD_DIR="$PROJECT_ROOT/build"
SHELL_NIX="$PROJECT_ROOT/shell.nix"

exec    nix-shell "$SHELL_NIX" --run \
        "cmake -S '$PROJECT_ROOT' -B '$BUILD_DIR' && cmake --build '$BUILD_DIR'"

cmake -S "$PROJECT_ROOT" -B "$BUILD_DIR"
cmake --build "$BUILD_DIR"