# Vim aliases
##BH |v|Opens nvim|
alias v="nvim"
##BH |nv|Opens nvim|
alias nv="nvim"
##BH |vim|Opens nvim|
alias vim="nvim"
##BH |ovim|Opens old/original vim instead of nvim|
alias ovim="/usr/bin/vim"

##BH |vbash|To edit `.bashrc` inside user home directory|
alias vbash="vim ~/.bashrc"
##BH |vdbash|To edit `bashrc` provided by this repository, **This works only if this repo cloned to home directory.**|
alias vdbash="vim ~/devenv/bashrc"
##BH |sbash|Source bash environment again after unaliasing all shortcuts|
alias sbash="unalias -a;source ~/.bashrc"
##BH |l|List files with colors, show sizes in readable format and sort to print latest file at last |
alias l="ls --color -lhtr"
##BH |lv|List files with colors, show sizes in readable format and sort by name |
alias lv="ls --color -lhvr"
##BH |ls|List files with colors |
alias ls="ls --color"
##BH |mygrep|Grep recursive, prints numbers, excludes binaries, files with extensions .o, .o.cmd, .d, .htm, .map, .xsl files with names cscope*, *tags |
alias mygrep='grep -nrs --binary-files=without-match --color --exclude "*.o" --exclude "*.o.cmd" --exclude "*.d" --exclude "cscope*" --exclude "*tags" --exclude "*.htm" --exclude "*.map" --exclude "*.xsl"'
##BH |d2u|Dos to unix command |
alias d2u="dos2unix"
##BH |gettimestamp|Prints time in `YYYYMMDD_hhmmss` format. Usefull for generating any filenames based on timestamp|
alias gettimestamp="date +%Y%m%d_%H%M%S"
##BH |gettimestampbb|Prints time in `YYYY.MM.DD-hh:mm:ss` format. Usefull for generating any filenames based on timestamp|
alias gettimestampbb="date +%Y.%m.%d-%H:%M:%S"
##BH |getsource|Get any git repo as a tar ball witout git information.|
alias getsource="tar --exclude="./.git" -czvf codebase_$(date +%Y%m%d_%H%M%S).tar.gz ./"
##BH |fsw|Find any swap files in current directory|
alias fsw="find . -name *.swp"

##BH |hugelist|Find top 5 space consuming files or directories|
alias hugelist="du -sh .[!.]* * | sort -rh | head -5"
##BH |cdsize|Current directory size|
alias cdsize="du -sh"
##BH |?|Get details of an alias/command example "? fsw"|
alias ?="type -a"

# enable vi mode in shell too.
# set -o vi

##BH |r|Refresh command, if some programs delte and recreate some directory you can just press r to refresh it. works mostly ;)|
alias r="ls -lhtr;cd $PWD"

# Changing this needs to restart tmux if using
export USE_PWR_FONTS=1
if [ $USE_PWR_FONTS == 1 ]
then
    PROMPT_SEP="\uE0B0"
fi

##BH |csd|Open cscope with available cscope files in current directory|
alias csd='CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kd'
#alias cscope='find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files; ctags --exclude=*/.pc/* --exclude=*.patch -R .;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files'
#alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
##BH |cs|Create cscope db and open cscope. This also takes directories as arguments to which cscopedb need to be created.|
cs ()
{
    if [ $# == 0 ];then
        find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files; ctags --exclude=*/.pc/* --exclude=*.patch -R .;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files
    else
        find $@ \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files; ctags --exclude=*/.pc/* --exclude=*.patch -R $@;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files
    fi
}
##BH |csf|Similar to above `cs` but removes all the cscope db files before creating new set of files. This can used to refresh the db if source is changed.|
csf ()
{
    if [ -f tags ]; then
        rm -rf tags
    fi
    if [ -f cscope.out ]; then
        rm -rf cscope.out
    fi
    if [ -f cscope.files ]; then
        rm -rf cscope.files
    fi
    cs $@
}
# Tmux aliases
##BH |tmux|Run `tmux` command with predefined env settings aliased to `EDITOR=nvim TERM=tmux-256color tmux -2 -u`|
alias tmux="EDITOR=nvim TERM=tmux-256color tmux -2 -u"
##BH |tmn|Open new tmux session with given name, by default it opens first window with 3 vertical panes, **Not giving argument causes unwanted behavior**|
tmn () 
{
    tmux new -t $1 \; split-window -h -c "#{pane_current_path}" \; split-window -h -c "#{pane_current_path}" \; select-pane -L \; select-layout even-horizontal
}
##BH |rnp|Sets a titile which inturn renames a pane in tmux|
rnp()
{
    if [ "$1" == "" ]
    then
        printf '\033]2;%s\033\\' 'NO PANE TITLE'
    else
        printf '\033]2;%s\033\\' $1
    fi
}
##BH |tma|Attach to running tmux session|
alias tma="tmux attach -d -t"
##BH |tml|list currently running tmux sessions|
alias tml="tmux ls"
##BH |vtm|Open tmux custom config provided by this repository for editing in vim|
alias vtm="vim ~/.mytmux.conf"
##BH |tmk|Kill tmux server and kill all processes having `tmux` in their command|
alias tmk="tmux kill-server; kill -9 \$(ps -eaf|grep tmu[x] | cut -d\" \" -f2)"

bashrc_sourced=$(stat -c %Y ~/.bashrc)
bashdevrc_sourced=$(stat -c %Y ~/devenv/bashrc)

prompt_command='
   test $(stat -c %y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc;
   test $(stat -c %y ~/devenv/bashrc) -ne $bashdevrc_sourced && source ~/.bashrc
'
# Manage temporary files
##BH |vitmp|Create and open temporary file in vim|
alias vitmp="vim `mktemp`"
##BH |clean_tmp|Remove all temporary files created by `mktemp` command|
alias clean_tmp="rm -rf /tmp/tmp.*"


# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

##BH |lf|List file with fullpath usefull while remote copying.|
lf ()
{
    ls --color -lhtr $PWD/$1
}

##BH |countdown|Countdown timer become handy to track time sometimes.ex. `countdown 60` `countdown $((2*60*60))` `countdown $((24*60*60))`|
countdown(){
	date1=$((`date +%s` + $1));
	while [ "$date1" -ge `date +%s` ]; do 
		## Is this more than 24h away?
		days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
		echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S:%N)\r"; 
		sleep 0.1
	done
}
##BH |stopwatch|Stopwatch kind of display on terminal|
stopwatch(){
	date1=`date +%s`; 
	while true; do 
		days=$(( $(($(date +%s) - date1)) / 86400 ))
		echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S:%N)\r";
		sleep 0.1
	done
}

#HISTORY helpers
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=-100000                   # big big history
export HISTFILESIZE=-100000               # big big history
#shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#### GIT ALIASES
##BH |gids|git diff with staged changes|
gids ()
{
    git diff -w --staged HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

##BH |gidw|git diff ignoring white space|
gidw ()
{
    git diff -w HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}

##BH |gid|git diff|
gid ()
{
    git diff HEAD $@ > /tmp/.tmp_git_diff;
    vim /tmp/.tmp_git_diff;
}
##BH |gipa|git pull all|
alias gipa="git pull --all"
##BH |gip|git pull|
alias gip="git pull"
##BH |gir|git rebase|
alias gir="git rebase"
##BH |girc|git rebase continue|
alias girc="git rebase --continue"
##BH |girs|gir rebase skip|
alias girs="git rebase --skip"
##BH |gira|gir rebase abort|
alias gira="git rebase --abort"
##BH |gia|git add|
alias gia="git add"
##BH |gis|git status|
alias gis="git status"
##BH |gich|git checkout|
alias gich="git checkout"
##BH |gicb|git checkour new branch with given name|
alias gicb="git checkout -b"
##BH |gib|git branch|
alias gib="git branch"
##BH |giba|git show all branches including remotes|
alias giba="git branch -a"
##BH |gil|git log|
alias gil="git log"
##BH |gilo|git log in oneline format|
alias gilo="git log --oneline"
##BH |gico|git commit with adding signature|
alias gico="git commit -s"

##BH |f|Simple find command to find given patterned files in current directory|
f ()
{
    find . -name "*$1*"
}

##BH |man|Similar to man but presented colorful|
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

##BH |getsymbolo|Debugging helper find any symbol from compile .o files in any subdirectory.|
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

##BH |bkp|Just create a backup of file/directory with appending timestamp to its name.|
bkp ()
{
    cp -rf $1 $1_$(gettimestamp)
}

##BH |tarbkp|Just create a backup of file/directory with timestamp as tarball.|
tarbkp ()
{
    tar -czvf $1_$(gettimestamp).tar.gz $1
}

##### 24bit/16M RGB color helpers

##BH |printcolors|Test terminal supports 256 colors or not. Also outputs color numbers.|
printcolors()
{
    for i in {0..255} ; do
        printf "\e[38;5;${i}mcolour${i}\n"
    done
}

##BH |rgbtest|Test your terminal supports rgb colors or not and print them|
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


##BH ||Function naming as (t)(clr)(t)(b) --> (true)(color)(text)(bold)|
##BH ||tclrtb, tclrt. tclrbg are single argument functions which take one color code|
##BH ||tclr and tclrb takes two arguments first one background and second one foreground|
##BH ||tclre ends color coding. **All color codes to be given in hex format**|

##BH |tclrtb|Color only foreground and set text to bold|
tclrtb ()
{
    x="0x$1"
    printf "\e[1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrt|Color only foreground|
tclrt ()
{
    x="0x$1"
    printf "\e[38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrbg|Color only background|
tclrbg ()
{
    x="0x$1"
    printf "\e[48;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrb|Color background and foreground and make text to bold|
tclrb ()
{
    x="0x$1"
    y="0x$2"
    printf "\e[48;2;%d;%d;%d;1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

##BH |tclrb|Color background and foreground.|
tclr ()
{
    x="0x$1"
    y="0x$2"
    printf "\e[48;2;%d;%d;%d;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

##BH |tclre|Ends color coding.|
tclre()
{
    printf "\e[0m"
}

##BH |myecho|echo command wrapper with colored errors,warnings and highlighted directory entries and exits.|
myecho()
{
	pathpat="(/[^/]*)+:[0-9]+"
	ccbgyellow=$(echo -e "\033[48;2;255;255;51;38;2;0;0;0m")
	ccbggreen=$(echo -e "\033[48;2;0;255;0;38;2;0;0;0m")
	ccbgred=$(echo -e "\033[48;2;255;0;0;38;2;0;0;0m")
	ccbgmagenta=$(echo -e "\033[48;2;255;79;243;38;2;0;0;0m")

	ccend=$(echo -e "\033[0m")
	echo "$@" 2>&1 | sed -E  -e "s%\b[Ee][Rr][Rr][Oo][Rr]\b|\b[Ee][Rr][Rr]\b%$ccbgred&$ccend%g" -e "s%\b[Ww][aA][rR][nN][iI][nN][gG]\b|\b[Ww][aA][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%\b[Ww][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%Entering%$ccbggreen>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}
##BH |mmk|Make command wrapper with colored errors,warnings and highlighted directory entries and exits.|
mmk()
{
	pathpat="(/[^/]*)+:[0-9]+"
	ccbgyellow=$(echo -e "\033[48;2;255;255;51;38;2;0;0;0m")
	ccbggreen=$(echo -e "\033[48;2;0;255;0;38;2;0;0;0m")
	ccbgred=$(echo -e "\033[48;2;255;0;0;38;2;0;0;0m")
	ccbgmagenta=$(echo -e "\033[48;2;255;79;243;38;2;0;0;0m")

	ccend=$(echo -e "\033[0m")
	/usr/bin/make "$@" 2>&1 | tee /tmp/buildlog | sed -E  -e "s%\b[Ee][Rr][Rr][Oo][Rr]\b|\b[Ee][Rr][Rr]\b%$ccbgred&$ccend%g" -e "s%\b[Ww][aA][rR][nN][iI][nN][gG]\b|\b[Ww][aA][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%\b[Ww][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%Entering%$ccbggreen>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}

##BH |create_pkeys|create ssh keys for automatic ssh logins.|
create_pkeys()
{
    cd ~;
    ssh-keygen -t rsa
    cd -
}

##BH |setup_ssh|Auto ssh login helper which set sshkeys to remote server, ex. `setup_ssh user@host`|
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

##BH |batch_mv|`batch_mv x y` Renames files containing `x` in their names and replaces `x` with `y`|
batch_mv()
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

    for i in $(find . -name "*$srcstr*")
    do
        res=${i/$srcstr/$replace}
        mv $i $res
    done
}
##BH |batch_rename|`batch_rename x y` Renames files containing `x` in their names and replaces `x` with `y`. This also replaces file contents having `x` to `y`|
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

# Thanks to https://gitlab.com/dwt1/dotfiles/-/blob/master/.bashrc

##BH |ex|archive extractor usage: ex <file>|
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

##BH |print_u8charset|Print whole UTF-8 char set. Not working correctly as there are several unwanted characters|
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

##BH |get_git_ls|Get git local status|
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

##BH |get_git_is|Get git index status information about ahead or behind|
get_git_is() {
    local st=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g" -e "s/ahead /+/g" -e "s/behind /-/g" -e "s/\[//g" -e "s/\]//g" | cut -s -d " " -f2-)
    if [ "$st" != "" ]
    then
        echo -ne "$st" 
    fi
}

##BH |get_git_lb|Get git local branch|
get_git_lb() {
    local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g" | cut -d " " -f1)

    if [ "$bi" != "" ]
    then
        local bil=$(echo $bi|cut -d"." -f1)
        echo -ne "${bil}" 
    fi
}

##BH |get_git_rb|Get git origin branch.|
get_git_rb() {
    local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g"| cut -d " " -f1)

    if [ "$bi" != "" ]
    then
        local bir=$(echo $bi|cut -s -d"." -f4)
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
    printf "\n"
    tclrt 6272a4
    if [ "$grb" != "" ]
    then
        printf "%${COLUMNS}s" "$gis $grb | $user@$hst | [$ts]"
    else
        printf "%${COLUMNS}s" "$user@$hst | [$ts]"
    fi
    tclre
    printf "\n"
    
    # Left prompt.

    # Git local status color setting green if clean red if changed with porcelain markings
    if [ "$gls" != "" ]
    then
        if [ "$gls" == "clean" ]
        then
            tclrb 50fa7b 44475a
        else
            tclrb ff5555 ffffff
        fi
        # actual status string
        printf " %s " "$gls"
        tclre
    fi

    if [ "$glb" != "" ]
    then
        # git local branch
        tclrb 6272a4 ffffff
        printf " %s " "$glb"
        tclre

        if [ $USE_PWR_FONTS == 1 ]
        then
            # separator with current background as foreground and next background as background.
            # powerline bulk arrow separator.
            tclrb bd93f9 6272a4 
            printf $PROMPT_SEP
            tclre
        fi
    fi

    tclrb bd93f9 000000
    printf " %s " "$d"
    tclre
    if [ $USE_PWR_FONTS == 1 ]
    then
        tclrt bd93f9
        printf $PROMPT_SEP
        tclre
    fi

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
}

if [ "$USER" == "root" ];
then
    PS1='\n\e[1;41m\e[1;37m[\D{%F %T}] \u@\h\e[1;49m \e[1;35m[$PWD]\$\[\e[0m\] \n\$ '
else
    PS1='`print_myprompt`\n$ '
fi
# After reading several suggestions decided to not set this in bashrc.
# terminal should set this
export TERM="xterm-256color"
