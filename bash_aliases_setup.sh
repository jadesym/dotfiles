os_name=$(uname -s)

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
    cp ./aliases/.ubuntu_auto_complete_bash_aliases ~/.ubuntu_auto_complete_bash_aliases

    source ~/.ubuntu_auto_complete_bash_aliases
fi
