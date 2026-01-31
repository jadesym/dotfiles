# This file should be kept in sync with .ubuntu_auto_complete_bash_aliases
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gpull='git pull'
alias gpom="git pull origin master"
alias gpush='git push'
alias gd='git diff'
# Sort the local branches first by commit date, then the remotes
alias gb=" { git branch --color=always --sort='-committerdate'; git branch -r --color=always --sort='-committerdate'; } | less -R"
alias gbl="git branch --color=always --sort='-committerdate'"
alias gdel='git branch -d'
alias gl="git log --graph --date=format:'%Y-%m-%d' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%ad%Creset %C(magenta)<%an>%Creset' --abbrev-commit"
# Get Git Last Commit Message
alias glcm="git log -1 --pretty=%B | tr -d '\n'"
# Rebase Current Branch onto Main
alias grbm='current_branch=$(git branch --show-current) && git checkout main && git pull && git checkout $current_branch && git rebase main'
# Create a PR with the current branch
alias gprc="git push origin HEAD && gh pr create -B main --fill && gh pr view -w"