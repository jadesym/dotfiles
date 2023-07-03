#!/bin/bash

# Define operating systems
OS_UBUNTU="Ubuntu"
OS_MACOS="MacOS"

# Check if OS environment variable is set and nonempty
if [[ -z "${OS}" ]]; then
    echo "OS environment variable is not set. Please set OS to either '$OS_UBUNTU' or '$OS_MACOS'."
    exit 1
fi

# Check if OS environment variable is either "Ubuntu" or "MacOS"
if [[ "${OS}" != "$OS_UBUNTU" ]] && [[ "${OS}" != "$OS_MACOS" ]]; then
    echo "OS environment variable is not valid. Please set OS to either '$OS_UBUNTU' or '$OS_MACOS'."
    exit 1
fi

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

# Check OS and use appropriate echo command
if [[ $OS == "$OS_MACOS" ]]; then
  echo '\n# Setting up the gitbar functionality for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
  echo "TMUX_GITBAR_DIR=$TMUX_ADDONS_DIR/.tmux-gitbar" >> $FINAL_TMUX_CONFIG_FILE_PATH
else
  echo -e '\n# Setting up the gitbar functionality for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
  echo -e "TMUX_GITBAR_DIR=$TMUX_ADDONS_DIR/.tmux-gitbar" >> $FINAL_TMUX_CONFIG_FILE_PATH
fi

echo "source-file $TMUX_ADDONS_DIR/.tmux-gitbar/tmux-gitbar.tmux" >> $FINAL_TMUX_CONFIG_FILE_PATH

# Copying over the dark themes we want
mkdir "$TMUX_ADDONS_DIR/themes"
cp $TOMORROW_NIGHT_THEMES_PATH "$TMUX_ADDONS_DIR/$TOMORROW_NIGHT_THEMES_PATH"

# Check OS and use appropriate echo command
if [[ $OS == "$OS_MACOS" ]]; then
  echo '\n# Setting up the dark themes for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
  echo "source-file $TMUX_ADDONS_DIR/$TOMORROW_NIGHT_THEMES_PATH" >> $FINAL_TMUX_CONFIG_FILE_PATH
else
  echo -e '\n# Setting up the dark themes for tmux' >> $FINAL_TMUX_CONFIG_FILE_PATH
  echo -e "source-file $TMUX_ADDONS_DIR/$TOMORROW_NIGHT_THEMES_PATH" >> $FINAL_TMUX_CONFIG_FILE_PATH
fi
