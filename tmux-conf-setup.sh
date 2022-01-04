HOME_DIR="$HOME"
TMUX_CONFIG_FILE_NAME=".tmux.conf"
FINAL_TMUX_CONFIG_FILE_PATH="$HOME_DIR/$TMUX_CONFIG_FILE_NAME"
TMUX_ADDONS_DIR="$HOME_DIR/.tmux"
TOMORROW_NIGHT_THEMES_PATH="themes/tomorrow-night.tmux"

# Copy .tmux.conf file into base user directory
cp $TMUX_CONFIG_FILE_NAME $HOME_DIR

# Wipe and reset the tmux addons directory
rm -rf $TMUX_ADDONS_DIR
mkdir $TMUX_ADDONS_DIR

# Gitbar setup for tmux, requires wiping existing gitbar directory
git clone https://github.com/arl/tmux-gitbar.git "$TMUX_ADDONS_DIR/.tmux-gitbar"
echo -e '\n# Setting up the gitbar functionality for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
echo -e 'TMUX_GITBAR_DIR="/path/to/tmux-gitbar"' >> $FINAL_TMUX_CONFIG_FILE_PATH
echo "source-file $TMUX_ADDONS_DIR/.tmux-gitbar/tmux-gitbar.tmux" >> $FINAL_TMUX_CONFIG_FILE_PATH

# Copying over the dark themes we want
mkdir "$TMUX_ADDONS_DIR/themes"
cp $TOMORROW_NIGHT_THEMES_PATH "$TMUX_ADDONS_DIR/$TOMORROW_NIGHT_THEMES_PATH"
echo -e '\n# Setting up the dark themes for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
echo "source-file $TMUX_ADDONS_DIR/$TOMORROW_NIGHT_THEMES_PATH" >> $FINAL_TMUX_CONFIG_FILE_PATH
