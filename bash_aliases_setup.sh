os_name=$(uname -s)

# # For Ubuntu, ensure that this exists in your ~/.bashrc
# # AFTER executing the bash_aliases bash script
#
# if [ -f ~/.ubuntu_bash_aliases_auto_complete ]; then
#     . ~/.bash_completion.d/complete_alias
#     . ~/.ubuntu_bash_aliases_auto_complete
# fi

if [ "$os_name" == "Darwin" ]; then
    # Do nothing since we already have auto completion in MacOS
else [ "$os_name" == "Linux "]; then
    # Install complete-alias for bash autocomplete
    mkdir ~/.bash_completion.d
    curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias \
        > ~/.bash_completion.d/complete_alias

    source ~/.bash_completion.d/complete_alias
else
    echo "Error: This script only supports macOS and Ubuntu. OS Name [$os_name] is not supported."
    exit 1
fi

# Remove and replace existing .bash_aliases
rm ~/.bash_aliases
cp ./aliases/.bash_aliases ~/.bash_aliases

source ~/.bash_aliases

if [ "$os_name" == "Linux" ]; then
    rm ~/.ubuntu_auto_complete_bash_aliases
    cp ./aliases/.ubuntu_bash_aliases_auto_complete ~/.ubuntu_bash_aliases_auto_complete

    source ~/.ubuntu_bash_aliases_auto_complete
fi
