#### WARNING KEEP ALL ALIASES AT bottom
# User specific aliases and functions
if [ "$USER" == "root" ];
then
PS1='\n\[\e[1;31m\][\u@\h $PWD]\$\[\e[0m\] \n\$ '
else
PS1='\n\[\e[1;35m\][\u@\h $PWD]\$\[\e[0m\] \n\$ '
fi
#PS1='\n\[\e[1;35m\][\u@\h \w]\$\[\e[0m\] \n\$ '
alias vbash="vim ~/.bashrc"
alias sbash="unalias -a;source ~/.bashrc"
alias l="ls --color -lhtr"
alias ls="ls --color"
alias mygrep='grep -nrs --binary-files=without-match --color --exclude "*.o" --exclude "*.o.cmd" --exclude "*.d" --exclude "cscope*" --exclude "*tags" --exclude "*.htm" --exclude "*.map" --exclude "*.xsl"'
alias cscoped='CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kd'
alias cscope='ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
export PATH="/opt/python-2.7.3/bin/:$PATH:/usr/local/bin:~/ciscosbrsdk/confd/CiscoConfdInstalled/bin/:~/eclipse/eclipse"
export WITH_GDB="y"
alias d2u="dos2unix"
alias gettimestamp="date +%Y%m%d_%H%M%S"
alias getsource="tar --exclude="./.git" -czvf codebase_$(date +%Y%m%d_%H%M%S).tar.gz ./"
alias fsw="find . -name *.swp"
alias gitdif="git diff > /tmp/.tmp_git_diff;vim /tmp/.tmp_git_diff"

alias getenv='tar -czf env.tar.gz ./.bashrc ./.vim*'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


#HISTORY helpers
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=-100000                   # big big history
export HISTFILESIZE=-100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

f ()
{
    find . -name "*$1*"
}

man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                        man "$@"
}

getsymbolo ()
{
    echo;
    for i in $(find . -name *.o);
    do
        nm $i |grep -w --color $1;
        if [ "$?" = 0 ];
        then 
            echo $i;
            echo;
        fi;
    done
}

backup ()
{
    cp -rf $1 $1_$(gettimestamp)
}
mymake()
{
	echo make in bash
	pathpat="(/[^/]*)+:[0-9]+"
	ccred=$(echo -e "\033[0;31m")
	ccyellow=$(echo -e "\033[0;33m")
	ccend=$(echo -e "\033[0m")
	/usr/bin/make "$@" 2>&1 | sed -E -e "s%[Ee][Rr][Rr][Oo][Rr]%$ccred&$ccend%g" -e "s%[Ww][aA][rR][nN][iI][nN][gG]%$ccyellow&$ccend%g"
	return ${PIPESTATUS[0]}
}

batch_rename()
{
    if [ "$1" = "" ]
    then
        echo "no arguments given"
        return
    elif [ "$2" = "" ]
    then
        echo "invalid replace string"
        return
    fi

    srcstr=$1;
    replace=$2;

    for i in $(mygrep -l $srcstr)
    do
        sed -i "s/$srcstr/$replace/g" $i
    done

    for i in $(find . -name "*$srcstr*")
    do
        res=${i/$srcstr/$replace}
        mv $i $res
    done
}

verifydockerconfig()
{
    echo $1
    for i in $(cat ~/dockerreqconfig.txt |grep "^CONFIG_" | cut -d: -f1); do grep "$i " $1 ; done
}

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export TERM="xterm-256color"
