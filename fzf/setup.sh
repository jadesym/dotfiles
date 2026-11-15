#!/bin/bash
set -e

brew install fzf bat

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/fzf"
mkdir -p "$config_dir"
cp "$script_dir/config.zsh" "$config_dir/config.zsh"

zshrc="${ZDOTDIR:-$HOME}/.zshrc"
source_line='source "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/config.zsh"'
if ! grep -qxF "$source_line" "$zshrc" 2>/dev/null; then
    printf '\n%s\n' "$source_line" >> "$zshrc"
fi
