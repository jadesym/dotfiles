# Enter opens the selected file with Yazi's bat/less reader; q returns to fzf.
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS }--bind 'enter:execute(LESSSECURE=1 bat --paging=always -- {})'"
