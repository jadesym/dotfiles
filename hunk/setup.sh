#!/bin/bash

HUNK_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HUNK_CONFIG_DIR="$HOME/.config/hunk"

mkdir -p "$HUNK_CONFIG_DIR"
cp "$HUNK_SCRIPT_DIR/config.toml" "$HUNK_CONFIG_DIR/config.toml"
