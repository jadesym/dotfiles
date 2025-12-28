#!/bin/bash

# Ask for email input
echo "Please enter your name for git configuration:"
read name

echo "Please enter your email for git configuration:"
read email

# Create .gitconfig file
cat > ~/.gitconfig << EOF
[user]
	name = $name
	email = $email
EOF

# Verify the operation
echo ".gitconfig file has been created with the following contents:"

# Display the content
cat ~/.gitconfig

# Set up git configurations
git config --global pull.rebase true
# Set the upstream branch for all local branches that have a matching remote branch
git config --global push.default current
# Set the default editor to vim
git config --global core.editor "vim"
# Automatically setup remote tracking
git config --global push.autoSetupRemote true
# Rewrite HTTPS GitHub URLs to use SSH (for authentication)
git config --global url."git@github.com:".insteadOf "https://github.com/"  # Allows git clone https://... to use SSH keys

# ============================================
# Git Delta - Better diff viewer
# ============================================

# Install git-delta based on OS
echo "Installing git-delta..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install git-delta
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Ubuntu/Linux
    sudo apt update && sudo apt install -y git-delta
else
    echo "Unsupported OS for git-delta installation. Please install manually."
fi

# Download delta themes.gitconfig
DELTA_THEMES_DIR="$HOME/.config/delta"
mkdir -p "$DELTA_THEMES_DIR"
echo "Downloading delta themes.gitconfig..."
curl -sL https://raw.githubusercontent.com/dandavison/delta/main/themes.gitconfig -o "$DELTA_THEMES_DIR/themes.gitconfig"

# Include the themes file in git config
git config --global include.path "$DELTA_THEMES_DIR/themes.gitconfig"

# Set up delta as the pager
git config --global core.pager delta

# Set up delta for interactive add
git config --global interactive.diffFilter 'delta --color-only'

# Enable navigation between diff sections with n/N
git config --global delta.navigate true

# Enable side-by-side view
git config --global delta.side-by-side true

# Use weeping-willow theme (Ubuntu only)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    git config --global delta.features weeping-willow
fi

# Use zdiff3 for better merge conflict display
git config --global merge.conflictStyle zdiff3

echo "Git delta has been configured successfully!"
