#!/bin/bash

os_name=$(uname -s)

if [ "$os_name" == "Darwin" ]; then
    brew install yazi bat ffmpeg-full sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick-full font-symbols-only-nerd-font
    brew link ffmpeg-full imagemagick-full -f --overwrite
elif [ "$os_name" == "Linux" ]; then
    curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
    echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null
    sudo apt update && sudo apt install yazi
else
    echo "Error: This script only supports macOS and Ubuntu. OS Name [$os_name] is not supported."
    exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/yazi"
mkdir -p "$config_dir"
cp "$script_dir/yazi.toml" "$config_dir/yazi.toml"
