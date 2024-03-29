# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# Vim aliases
alias mynvim="pyenvit && nvim"
##BH |v|Opens nvim|
alias v="mynvim"
##BH |vi|Opens nvim|
alias vi="mynvim"
##BH |nv|Opens nvim|
alias nv="mynvim"
##BH |vim|Opens nvim|
alias vim="mynvim"
##BH |ovim|Opens old/original vim instead of nvim|
alias ovim="TERM=xterm-256color /usr/bin/vim"
##BH |vdbg|Debug neovim with log file|
alias vdbg="> /tmp/nvim.log;nvim -V20/tmp/nvim.log /tmp/nvim.log"

##BH |vbash|To edit `.bashrc` inside user home directory|
alias vbash="vim ~/.bashrc"

##BH |sbash|Source bash environment again after unaliasing all shortcuts|
alias sbash="unalias -a;source ~/.bashrc"
##BH |l|List files with colors, show sizes in readable format and sort to print latest file at last |
alias l="ls --color -lhtr --group-directories-first"
##BH |cl|List files with colors, show sizes in readable format and sort to print latest file at last |
alias cl="colorls --color -lhtr --sd"
##BH |lv|List files with colors, show sizes in readable format and sort by name |
alias lv="ls --color -lhvr --group-directories-first"
##BH |ls|List files with colors |
alias ls="ls --color"
##BH |mygrep|Grep recursive, prints numbers, excludes binaries, files with extensions .o, .o.cmd, .d, .htm, .map, .xsl files with names cscope*, *tags |
alias mygrep='grep -nrs --binary-files=without-match --color --exclude "*.o" --exclude "*.o.cmd" --exclude "*.d" --exclude "cscope*" --exclude "*tags" --exclude "*.htm" --exclude "*.map" --exclude "*.xsl" --exclude-dir ".git"'
##BH |myrg|Grep recursive, prints numbers, excludes binaries, files with extensions .o, .o.cmd, .d, .htm, .map, .xsl files with names cscope*, *tags |
alias myrg='rg --color always'

if [ -n "$(type -P clangd-13)" ];then
    alias clangd="clangd-13"
else
    alias clangd="clangd-11"
fi

jedi-language-server ()
{
    ~/.local/bin/jedi-language-server
}

alias ssh="TERM=xterm-256color ssh -o ServerAliveInterval=60"

##BH |ai| shortcut to apt-get install|
alias ai="apt-get -yqm install"
##BH |sau| shortcut to sudo apt-get update and upgrade|
alias sau="sudo apt-get -yqm update;sudo apt-get -yqm upgrade"
##BH |sai| shortcut to sudo apt-get install|
alias sai="sudo apt-get -yqm install"

##BH |cho|Make current user as owner for all given files|
alias cho="sudo chown -R $USER:$USER"
##BH |chx|Give executable permission to given files|
alias chx="chmod +x"

# enable vi mode in shell too.
# set -o vi

##BH |r|Refresh command, if some programs delte and recreate some directory you can just press r to refresh it. works mostly ;)|
r ()
{
    ls -lhtr;
    cd $(pwd)
}

##BH |f|Simple find command to find given patterned files in current directory|
f ()
{
    find . -name "$@"
}

##BH |lf|List file with fullpath usefull while remote copying.|
lf ()
{
    ls --color -lhtr $PWD/$1
}

##BH |mkcd|Make directory and cd to it|
mkcd()
{
    mkdir -p $@ && cd $1
}

alias g='BROWSER=w3m googler -n 7 -c en -l en'
if [ "$TMUX" != "" ];then
    eval $(tmux showenv|grep ^DISPLAY)
fi

##BH |netspeed|Shows current bandwidth consumption of each network interface|
netspeed()
{
    local IF=""
    for IF in $(ls /sys/class/net/)
    do
            R1=`cat /sys/class/net/$IF/statistics/rx_bytes`
            T1=`cat /sys/class/net/$IF/statistics/tx_bytes`
            sleep 1
            R2=`cat /sys/class/net/$IF/statistics/rx_bytes`
            T2=`cat /sys/class/net/$IF/statistics/tx_bytes`
            TBPS=`expr $T2 - $T1`
            RBPS=`expr $R2 - $R1`
            TKBPS=`expr $TBPS / 1024`
            RKBPS=`expr $RBPS / 1024`
            echo "Current BW on $IF tx $1: $TKBPS kB/s rx $1: $RKBPS kB/s"
    done
}
