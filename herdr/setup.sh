#!/bin/bash
set -e

HERDR_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HERDR_CONFIG_DIR="$HOME/.config/herdr"

mkdir -p "$HERDR_CONFIG_DIR"
cp "$HERDR_SCRIPT_DIR/config.toml" "$HERDR_CONFIG_DIR/config.toml"
