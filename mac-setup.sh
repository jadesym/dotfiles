./bash_aliases_setup.sh

# Expand bash_aliases to non-interactive shells
shopt -s expand_aliases
source ~/.bash_aliases

./vim-setup.sh

brew install tmux
./tmux-conf-setup.sh

./zsh-mac-setup.sh
