# Locally stash anything being currently worked on
git add .
git stash

HOME_DIR="$HOME"
TMUX_CONFIG_FILE_NAME=".tmux.conf"
FINAL_TMUX_CONFIG_FILE_PATH="$HOME_DIR/$TMUX_CONFIG_FILE_NAME"

# Copy .tmux.conf file into base user directory
cp $TMUX_CONFIG_FILE_NAME $HOME_DIR

# Gitbar setup for tmux, requires wiping existing gitbar directory
rm -rf ~/.tmux-gitbar
git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar
echo -e '\n# Setting up the gitbar functionality for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
echo 'source-file "$HOME/.tmux-gitbar/tmux-gitbar.tmux"' >> $FINAL_TMUX_CONFIG_FILE_PATH

# Pop anything locally stashed to return back to original state
git stash pop
