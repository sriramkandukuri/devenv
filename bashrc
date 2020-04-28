#### WARNING KEEP ALL ALIASES AT bottom
# User specific aliases and functions
#PS1='\n\[\e[1;35m\][\u@\h \w]\$\[\e[0m\] \n\$ '
alias vbash="vim ~/.bashrc"
alias vdbash="vim ~/devenv/bashrc"
alias sbash="unalias -a;source ~/.bashrc"
alias l="ls --color -lhtr"
alias ls="ls --color"
alias mygrep='grep -nrs --binary-files=without-match --color --exclude "*.o" --exclude "*.o.cmd" --exclude "*.d" --exclude "cscope*" --exclude "*tags" --exclude "*.htm" --exclude "*.map" --exclude "*.xsl"'
alias cscoped='CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kd'
alias cscope='ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
export PATH="/opt/python-2.7.3/bin/:$PATH:/usr/local/bin:~/eclipse/eclipse"
export WITH_GDB="y"
alias d2u="dos2unix"
alias gettimestamp="date +%Y%m%d_%H%M%S"
alias getsource="tar --exclude="./.git" -czvf codebase_$(date +%Y%m%d_%H%M%S).tar.gz ./"
alias fsw="find . -name *.swp"
alias ?="type -a"
alias vdenv="vim ~/devenv/bashrc"
alias r="ls -lhtr;cd $PWD"
alias tmux="EDITOR=vim TERM=tmux-256color tmux -2 -u"
alias tmn="tmux new -t"
alias tma="tmux attach -d -t"
alias tml="tmux ls"
alias vtm="vim ~/.mytmux.conf"
alias mw="cd ~/data/sriram"

bashrc_sourced=$(stat -c %Y ~/.bashrc)
bashdevrc_sourced=$(stat -c %Y ~/devenv/bashrc)

PROMPT_COMMAND='
    test $(stat -c %Y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc;
    test $(stat -c %Y ~/devenv/bashrc) -ne $bashdevrc_sourced && source ~/.bashrc
'

alias getenv='tar -czf env.tar.gz ./.bashrc ./.vim*'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

printcolors()
{
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
        "]"
}


lf ()
{
    ls --color -lhtr $PWD/$1
}

#HISTORY helpers
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=-100000                   # big big history
export HISTFILESIZE=-100000               # big big history
#shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

gitdifs ()
{
    git diff -w --staged HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}
gitdifw ()
{
    git diff -w HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}
gitdif ()
{
    git diff HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

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
tclrbg ()
{
    x="0x$1"
    shift
    str="$@"
    #echo $x $y
    printf "\x1b[1;48;2;%d;%d;%dm$str\x1b[0m" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

tclrb ()
{
    x="0x$1"
    y="0x$2"
    shift
    shift
    str="$@"
    #echo $x $y
    printf "\x1b[48;2;%d;%d;%d;1;38;2;%d;%d;%dm$str\x1b[0m" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}
tclr ()
{
    x="0x$1"
    y="0x$2"
    shift
    shift
    str="$@"
    #echo $x $y
    printf "\x1b[48;2;%d;%d;%d;38;2;%d;%d;%dm$str\x1b[0m" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}
myecho()
{
	echo make in bash
	pathpat="(/[^/]*)+:[0-9]+"
	ccred=$(echo -e "\033[0;31m")
	ccyellow=$(echo -e "\033[0;33m")
	ccbgyellow=$(echo -e "\033[48;2;255;255;51;38;2;0;0;0m")
	cccyan=$(echo -e "\033[0;36m")
	cccyan=$(echo -e "\033[0;36m")
	cclcyanbold=$(echo -e "\033[1;106m")
	ccmagenta=$(echo -e "\033[0;35m")
	ccbgmagenta=$(echo -e "\033[48;2;255;79;243;38;2;0;0;0m")
	ccmagenta=$(echo -e "\033[0;34m")
	ccend=$(echo -e "\033[0m")
	echo "$@" 2>&1 | sed -E  -e "s%[Ee][Rr][Rr]|[Ee][Rr][Rr][Oo][Rr]|[Ee][Rr][Rr]%$ccred&$ccend%g" -e "s%[Ww][aA][rR][nN]|[Ww][aA][rR][nN][iI][nN][gG]%$ccyellow&$ccend%g" -e "s%[Ww][rR][nN]%$ccyellow&$ccend%g" -e "s%Entering%$ccbgyellow>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}
mmk()
{
	echo make in bash
	pathpat="(/[^/]*)+:[0-9]+"
	ccred=$(echo -e "\033[0;31m")
	ccyellow=$(echo -e "\033[0;33m")
	ccbgyellow=$(echo -e "\033[48;2;255;255;51;38;2;0;0;0m")
	cccyan=$(echo -e "\033[0;36m")
	cccyan=$(echo -e "\033[0;36m")
	cclcyanbold=$(echo -e "\033[1;106m")
	ccmagenta=$(echo -e "\033[0;35m")
	ccbgmagenta=$(echo -e "\033[48;2;255;79;243;38;2;0;0;0m")
	ccmagenta=$(echo -e "\033[0;34m")
	ccend=$(echo -e "\033[0m")
	/usr/bin/make "$@" 2>&1 | tee /tmp/buildlog | sed -E  -e "s%[Ee][Rr][Rr]|[Ee][Rr][Rr][Oo][Rr]%$ccred&$ccend%g" -e "s%[Ww][aA][rR][nN]|[Ww][aA][rR][nN][iI][nN][gG]%$ccyellow&$ccend%g" -e "s%[Ww][rR][nN]%$ccyellow&$ccend%g" -e "s%Entering%$ccbgyellow>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}

# rgbcolors()
# {
#     for r in {0..255}
#     do
#         for g in {0..255}
#         do
#         done
#     done
# }

rgbtest()
{
	awk 'BEGIN{
	s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
	for (colnum = 0; colnum<77; colnum++) {
		r = 255-(colnum*255/76);
		g = (colnum*510/76);
		b = (colnum*255/76);
		if (g>255) g = 510-g;
			printf "\033[48;2;%d;%d;%dm", r,g,b;
			printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
			printf "%s\033[0m", substr(s,colnum+1,1);
		}
		printf "\n";
	}'
}

create_pkeys()
{
    cd ~;
    ssh-keygen -t rsa
    cd -
}
setup_ssh()
{
    cd ~;
    ssh $@ mkdir -p .ssh
    cat .ssh/id_rsa.pub | ssh $@ 'cat >> .ssh/authorized_keys'
    ssh $@ "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
    cd -
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

print_u8charset ()
{
    for i in {0..255}
    do
        x=`printf "\uE0%2x" $i`
        echo -e "$x"
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

parse_git_dirty() {
    x=$(git status --porcelain 2> /dev/null)
    if [ "$?" == "0" ]
    then
        x=$(git status --porcelain 2> /dev/null| cut -c1,2 |sort|uniq | awk '{print}' ORS=' ')
        if [[ "$x" == "" ]]
        then
            tclr 006c00 ffffff " clean "
        else
            tclr 6c0000 ffffff " $x "
        fi
    fi
}
parse_git_branch() {
    git status -bs 2> /dev/null|head -1
}

if [ "$USER" == "root" ];
then
PS1='\n\e[1;41m\e[1;37m[\D{%F %T}] \u@\h\e[1;49m \e[1;35m[$PWD]\$\[\e[0m\] \n\$ '
else
    PS1='\n\e[`tclrb 005f5f ffffff " [\D{%F %T}] \u@\h "``tclrb fbff82 912e00 "$(parse_git_branch)"``parse_git_dirty``tclrb 73d7de 000000 " [$PWD]\$ "`\n\$ '
fi
#export TERM="xterm-256color"
