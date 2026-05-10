curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER:=`whoami`}

if ! grep -qxF "export LESS='-N'" ~/.zshrc 2>/dev/null; then
    echo "export LESS='-N'" >> ~/.zshrc
fi
