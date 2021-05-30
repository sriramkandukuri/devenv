export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

##BH |hfzf|fzf with hidden files enabled|
hfzf ()
{
    export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --ignore"
    export FZF_DEFAULT_OPTS="--ansi"
}
if [ -f ~/.fzf.bash ]
then
    source ~/.fzf.bash
    source ~/devenv/build/fzf/fzf/shell/completion.bash
    source ~/devenv/shell/common/fzfgit.sh
fi


