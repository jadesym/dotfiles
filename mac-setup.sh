# Git setup
./git/setup.sh

./bash_aliases_setup.sh

# Expand bash_aliases to non-interactive shells
shopt -s expand_aliases
source ~/.bash_aliases

./vim-setup.sh

brew install tmux
OS="MacOS" ./tmux-conf-setup.sh

./zsh-mac-setup.sh

# Default to always showing hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -boolean true;
