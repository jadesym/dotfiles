# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

./yazi/setup.sh

# Git setup
./git/setup.sh

./bash_aliases_setup.sh

# Expand bash_aliases to non-interactive shells
source ~/.bash_aliases

./vim-setup.sh

brew install tmux
OS="MacOS" ./tmux-conf-setup.sh

./zsh-mac-setup.sh

# Default to always showing hidden files in finder; kill all Finder processes to ensure any opened Finder will pick up defaults
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

# Install vscode command line
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Install AI coding tools
curl -fsSL https://chatgpt.com/codex/install.sh | sh
mkdir -p "$HOME/.codex"
cp ./codex/config.toml "$HOME/.codex/config.toml"
curl -fsSL https://claude.ai/install.sh | bash

# Install Herdr and copy the repo config to ~/.config/herdr/config.toml
curl -fsSL https://herdr.dev/install.sh | sh
./herdr/setup.sh
