export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

##BH |hfzf|fzf with hidden files enabled|
hfzf ()
{
    export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --ignore"
    export FZF_DEFAULT_OPTS="--ansi"
}
