alias vbash="vim ~/.bashrc"
alias vdbash="vim ~/devenv/bashrc"
alias sbash="unalias -a;source ~/.bashrc"
alias l="ls --color -lhtr"
alias ls="ls --color"
alias mygrep='grep -nrs --binary-files=without-match --color --exclude "*.o" --exclude "*.o.cmd" --exclude "*.d" --exclude "cscope*" --exclude "*tags" --exclude "*.htm" --exclude "*.map" --exclude "*.xsl"'
alias cscoped='CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kd'
alias cscope='ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
alias d2u="dos2unix"
alias gettimestamp="date +%Y%m%d_%H%M%S"
# Get any git repo as a tar ball witout git information.
alias getsource="tar --exclude="./.git" -czvf codebase_$(date +%Y%m%d_%H%M%S).tar.gz ./"
alias fsw="find . -name *.swp"

# Get alias details "? fsw"
alias ?="type -a"

# Refresh command, if some programs delte and recreate some directory you can 
# just press r to refresh it.
# works mostly ;)
alias r="ls -lhtr;cd $PWD"

# Tmux aliases
alias tmux="EDITOR=vim TERM=tmux-256color tmux -2 -u"
alias tmn="tmux new -t"
alias tma="tmux attach -d -t"
alias tml="tmux ls"
alias vtm="vim ~/.mytmux.conf"

bashrc_sourced=$(stat -c %Y ~/.bashrc)
bashdevrc_sourced=$(stat -c %Y ~/devenv/bashrc)

prompt_command='
   test $(stat -c %y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc;
   test $(stat -c %y ~/devenv/bashrc) -ne $bashdevrc_sourced && source ~/.bashrc
'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# List file with fullpath usefull while remote copying.
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

#### GIT ALIASES
# git diff with staged changes
gitdifs ()
{
    git diff -w --staged HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

# git diff ignoring white space
gitdifw ()
{
    git diff -w HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

# git diff
gitdif ()
{
    git diff HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

alias gits="git status"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gb="git branch"
alias gba="git branch -a"
alias gl="git log"
alias glo="git log --oneline"
alias gcomit="git commit -s"

# Simple find
f ()
{
    find . -name "*$1*"
}

# Colorful man pages.
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

# Debugging helper find any symbol from compile .o files in any subdirectory.
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

# Just create a backup of file/directory with timestamp appending it to it.
backup ()
{
    cp -rf $1 $1_$(gettimestamp)
}

# Just create a backup of file/directory with timestamp as tarball.
tarbackup ()
{
    tar -czvf $1_$(gettimestamp).tar.gz $1
}

##### 24bit/16M RGB color helpers

# Test terminal supports 256 colors or not. Also outputs color numbers.
printcolors()
{
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

# Test your terminal supports rgb colors or not.
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


# Function naming as (t)(clr)(t)(b) --> (true)(color)(text)(bold)
# tclrtb, tclrt. tclrbg are single argument functions which take one color code
# tclr and tclrb takes two arguments first one background and second one foreground
# tclre ends color coding.

# Color only foreground and set letter to bold
tclrtb ()
{
    x="0x$1"
    printf "\x1b[1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

# Color only foreground
tclrt ()
{
    x="0x$1"
    printf "\x1b[38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

# Color only background
tclrbg ()
{
    x="0x$1"
    printf "\x1b[48;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

# Color background and foreground with bold ltters.
tclrb ()
{
    x="0x$1"
    y="0x$2"
    printf "\x1b[48;2;%d;%d;%d;1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

# Color background and foreground.
tclr ()
{
    x="0x$1"
    y="0x$2"
    printf "\x1b[48;2;%d;%d;%d;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

# Ends color coding.
tclre()
{
    printf "\x1b[0m"
}

# Make command wrapper with colored errors,warnings and highlighted directory entries and exits.
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
	/usr/bin/make "$@" 2>&1 | tee /tmp/buildlog | sed -E  -e "s% [Ee][Rr][Rr]|[Ee][Rr][Rr][Oo][Rr] %$ccred&$ccend%g" -e "s% [Ww][aA][rR][nN]|[Ww][aA][rR][nN][iI][nN][gG] %$ccyellow&$ccend%g" -e "s% [Ww][rR][nN] %$ccyellow&$ccend%g" -e "s%Entering%$ccbgyellow>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}

# create ssh keys for automatic ssh logins.
create_pkeys()
{
    cd ~;
    ssh-keygen -t rsa
    cd -
}

# Auto ssh login helper which set sshkeys to remote server
# setup_ssh user@host
setup_ssh()
{
    if [ ! -f .ssh/id_rsa.pub ]
    then
        create_pkeys
    fi
    cd ~;
    ssh $@ mkdir -p .ssh
    cat .ssh/id_rsa.pub | ssh $@ 'cat >> .ssh/authorized_keys'
    ssh $@ "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
    cd -
}

# Renames files and replaces given string from files
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

# Print whole UTF-8 char set. Not working correctly as there are several unwanted
# characters
print_u8charset ()
{
    count=0
    for i in {0..255}
    do
        for j in {0..255}
        do
            for k in {0..255}
            do
                x=$(printf "\\\x%02X\\\x%02X\\\x%02X" $i $j $k)
                printf "%s( $x )" $x
                count=`expr $count + 1`
                if [ $count == 100 ]
                then
                    count=0
                    echo
                fi
            done
        done
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

# Get git local status
get_git_ls()
{
    git status --porcelain 1> /dev/null 2>&1
    if [ "$?" == "0" ]
    then
        x=$(git status --porcelain 2> /dev/null| cut -c1,2 |sort|uniq | awk '{print}' ORS=' ')
        if [[ "$x" == "" ]]
        then
            echo -ne "clean" 
        else
            echo -ne "$x" 
        fi
    fi
}

# Get git index status 
# information about ahead or behind
get_git_is() {
    local st=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g" -e "s/ahead /+/g" -e "s/behind /-/g" -e "s/\[//g" -e "s/\]//g" | cut -s -d " " -f2-)
    if [ "$st" != "" ]
    then
        echo -ne "$st" 
    fi
}

# Get git local branch
get_git_lb() {
    local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g" | cut -d " " -f1)

    if [ "$bi" != "" ]
    then
        local bil=$(echo $bi|cut -d"." -f1)
        echo -ne "${bil}" 
    fi
}

# Get git origin branch.
get_git_rb() {
    local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g"| cut -d " " -f1)

    if [ "$bi" != "" ]
    then
        local bir=$(echo $bi|cut -d"." -f4)
        echo -ne "${bir}" 
    fi
}

# fancy prompt with git details time stamp directory, git dirty status etc..
print_myprompt() {

    local lcs=$?
    local d=`dirs`
    local glb=`get_git_lb`
    local grb=`get_git_rb`
    local gls=`get_git_ls`
    local gis=`get_git_is`


    local user=$USER
    local hst=$(hostname|cut -d"." -f1)
    local ts=$(date +"%d/%m/%Y %H:%M:%S")

    # Right prompt. Very light color, as it is very less important info.
    tclrt 555555
    if [ "$grb" != "" ]
    then
        printf "\n%${COLUMNS}s" "$gis $grb | $user@$hst | [$ts]"
    else
        printf "\n%${COLUMNS}s" "$user@$hst | [$ts]"
    fi
    tclre
    
    # Left prompt.

    # Git local status color setting green if clean red if changed with porcelain markings
    if [ "$gls" != "" ]
    then
        if [ "$gls" == "clean" ]
        then
            tclrb 006c00 ffffff
        else
            tclrb e61b00 ffffff
        fi
        # actual status string
        printf " %s " "$gls"
        tclre
    fi

    if [ "$glb" != "" ]
    then
        # git local branch
        tclrb 0057a3 ffffff
        printf " %s " "$glb"
        tclre

        # separator with current background as foreground and next background as background.
        # powerline bulk arrow separator.
        tclrb 73d7de 0057a3 
        printf "\uE0B0"
        tclre
    fi

    tclrb 73d7de 000000
    printf " %s " "$d"
    tclre
    tclrt 73d7de
    printf "\uE0B0"
    tclre

    # last command status. green if 0 red if error.
    if [[ "$lcs" == "130" ]]
    then
        tclrt deb810
    elif [ "$lcs" != 0 ]
    then
        tclrt fc2e00
    else
        tclrt 00ff00
    fi
    printf " %s " "$lcs"
    tclre
    printf "\n"
}
if [ "$USER" == "root" ];
then
PS1='\n\e[1;41m\e[1;37m[\D{%F %T}] \u@\h\e[1;49m \e[1;35m[$PWD]\$\[\e[0m\] \n\$ '
else
    PS1='`print_myprompt`\n$ '
fi
# After reading several suggestions decided to not set this in bashrc.
# terminal should set this
#export TERM="xterm-256color"
