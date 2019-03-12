git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar
echo 'source-file "$HOME/.tmux-gitbar/tmux-gitbar.tmux"' >> .tmux.conf

# Copy .tmux.conf file into base user directory
cp .tmux.conf ~/

