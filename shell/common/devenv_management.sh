##BH |vdbash|To edit `bashrc` provided by this repository, **This works only if this repo cloned to home directory.**|
alias vdbash="vim ~/devenv/shell/bash/devenv_bashrc"
##BH |genhelp|Generate help documents of devenv|
alias genhelp='~/devenv/help/genhelp.sh'
dumphelp ()
{
    [ "$2" != "" ] && cat $1 | grep -E "^\|" | column -t -s'|' |grep $2 |sed 's/^[ \t]*//;s/[ \t]*$//' && return
    cat $1 | grep -E "^\|" | column -t -s'|' | sed 's/^[ \t]*//;s/[ \t]*$//'
    # [ "$2" != "" ] && cat $1 |grep $2 && return
    # cat $1 | column -t -s'|'
}
##BH |tmhelp|Show tmux shortcuts help|
tmhelp ()
{
    dumphelp ~/devenv/help/tmuxhelp.md $1
}
##BH |bhelp|Show bashrc shortcuts help|
bhelp ()
{
    dumphelp ~/devenv/help/bashhelp.md $1
}
##BH |vhg|Show help of any command from vim help|
vh ()
{
    vim -c "help $1"
}
##BH |vhg|Show help of any query from vim help|
vhg ()
{
    vim -c "helpgrep $1"
}
##BH |vhelp|Show custom vim shortcuts help|
vhelp ()
{
    dumphelp ~/devenv/help/vimhelp.md $1
}

