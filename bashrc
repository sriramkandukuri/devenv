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
alias clangd="clangd-11"

##BH |ai| shortcut to apt-get install|
alias ai="apt-get -yqm install"
##BH |sau| shortcut to sudo apt-get update and upgrade|
alias sau="sudo apt-get -yqm update;sudo apt-get -yqm upgrade"
##BH |sai| shortcut to sudo apt-get install|
alias sai="sudo apt-get -yqm install"

alias jedi-language-server="~/.local/bin/jedi-language-server"

##BH |cheat|Show help from cheat.sh|
cheat ()
{
    curl cht.sh/$@
}

##BH |mkcd|Make directory and cd to it|
mkcd()
{
    mkdir -p $@ && cd $1
}

##BH |cho|Make current user as owner for all given files|
alias cho="sudo chown -R $USER:$USER"
##BH |chx|Give executable permission to given files|
alias chx="chmod +x"

# enable vi mode in shell too.
# set -o vi

##BH |r|Refresh command, if some programs delte and recreate some directory you can just press r to refresh it. works mostly ;)|
alias r="ls -lhtr;cd $PWD"

# Changing this needs to restart tmux if using
export USE_PWR_FONTS=1
export DEVENV_LOADED=1
if [ $USE_PWR_FONTS == 1 ]
then
    PROMPT_SEP="\uE0B0"
fi

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
    dumphelp ~/devenv/tmuxhelp.md $1
}
##BH |bhelp|Show bashrc shortcuts help|
bhelp ()
{
    dumphelp ~/devenv/bashhelp.md $1
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
    dumphelp ~/devenv/vimhelp.md $1
}

##BH |csd|Open cscope with available cscope files in current directory|
alias csd='CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kd'
#alias cscope='find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files; ctags --exclude=*/.pc/* --exclude=*.patch -R .;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files'
#alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
##BH |cs|Create cscope db and open cscope. This also takes directories as arguments to which cscopedb need to be created.|

cs ()
{
    printf "%s\n" "-ferror-limit=0" > compile_flags.txt
    $(gcc -print-prog-name=cc1) -v /dev/null -o /dev/null 2>&1 | grep include | grep -v "^#" | grep -v "ignoring" | sed -e 's/^ /-I\n/g' >> compile_flags.txt
    printf "%s\n%s\n%s\n%s\n%s\n" "%h" "-I" "./" "-I" "../" >> compile_flags.txt
    if [ $# == 0 ];then
        find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.py" \) > cscope.files && \
        find . -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | xargs dirname | awk '!x[$0]++' | sed -e 's/^/-I\n/g' >> compile_flags.txt && \
        find . -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | awk '!x[$0]++' | sed -e 's/^/-I\n/g' >> compile_flags.txt && \
        ctags --exclude=*/.pc/* --exclude=*.patch -R . && \
        CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files;
    else
        find $@ \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.py" \) > cscope.files && \
        find $@ -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | xargs dirname | sort -u | sed -e 's/^/-I/g' >> compile_flags.txt && \
        find $@ -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | sort -u | sed -e 's/^/-I/g' >> compile_flags.txt && \
        ctags --exclude=*/.pc/* --exclude=*.patch -R $@ && \
        CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files;
    fi
}
##BH |csf|Similar to above `cs` but removes all the cscope db files before creating new set of files. This can used to refresh the db if source is changed.|
csf ()
{
    rm -rf $(find . -name "cscope.out" -o -name "tags" -o -name "compile_flags.txt" -o -name "cscope.files" -o -name "ccls-cache")
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
alias tmk="tmux kill-server; kill -9 \$(ps -eaf|grep tmu[x] | sed 's/  */ /g' | cut -d\" \" -f2)"
##BH |tmks|Kill session with given name|
alias tmks="tmux kill-session -t"

bashrc_sourced=$(stat -c %Y ~/.bashrc)
bashdevrc_sourced=$(stat -c %Y ~/devenv/bashrc)

prompt_command='
   test $(stat -c %y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc;
   test $(stat -c %y ~/devenv/bashrc) -ne $bashdevrc_sourced && source ~/.bashrc
'
# Manage temporary files
##BH |vitmp|Create and open temporary file in vim|
vitmp() 
{
    vim $(mktemp)
}
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

gconfig ()
{
    git config --global core.pager "~/devenv/build/fancydiff/diff-so-fancy/diff-so-fancy | less --tabs=4 -RFX"
    git config --global interactive.diffFilter "~/devenv/build/fancydiff/diff-so-fancy/diff-so-fancy --patch"

    git config --global color.ui true

    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"

    git config --global color.diff.meta       "11"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.func       "146 bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
}

##BH |gid|git diff|
gid ()
{
    if [ "$vopts" == "V" ] 
    then
        git diff $opts $@ | diff-so-fancy > /tmp/.tmp_git_diff;
        vim -c ":term cat /tmp/.tmp_git_diff";
        # vim /tmp/.tmp_git_diff;
    else
        git diff $opts $@
    fi
    opts=""
    vopts=""
}

##BH |gids|git diff with staged changes|
gids ()
{
    opts="-w --staged HEAD"
    gid $@
}

##BH |gidw|git diff ignoring white space|
gidw ()
{
    opts="-w HEAD"
    gid $@
}

##BH |vgid|git diff open in vim|
vgid ()
{
    vopts="V"
    gid $@
}

##BH |vgids|git diff with staged changes opens in vim|
vgids ()
{
    vopts="V"
    gids $@
}

##BH |vgidw|git diff ignoring white space opens in vim|
vgidw ()
{
    vopts="V"
    gidw $@
}


##BH |gicl|git clone|
gicl ()
{
    git clone $@
}

##BH |gigt|git get theirs|
alias gigt="git checkout --theirs"
##BH |gigo|git get ours|
alias gigo="git checkout --ours"
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
# see `git help log` for detailed help.
#   %h: abbreviated commit hash
#   %d: ref names, like the --decorate option of git-log(1)
#   %cn: commiter name
#   %ce: committer email
#   %cr: committer date, relative
#   %ci: committer date, ISO 8601-like format
#   %an: author name
#   %ae: author email
#   %ar: author date, relative
#   %ai: author date, ISO 8601-like format
#   %s: subject
##BH |gilol | awesome git log replacement|
alias gilol='git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %C(green)%cn <%ce>%Creset%n     %s"'
##BH |gilod |git log same as above, but ISO date|
alias gilod='git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%ci)%Creset %C(green)%cn <%ce>%Creset%n     %s"'
##BH |gilobi | git log using **b**uild-**i**n standards|
alias gilobi="git log --oneline --graph --decorate"
##BH |gilobc | git log to show **b**ranches and their last **c**ommits|
alias gilobc="git log --all --graph --decorate --oneline --simplify-by-decoration --date=short"
##BH |gigl| **gi**t **g**raph by **l**og|
alias gigl='git log --all --graph --decorate --oneline --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n"'
##BH |gigb| **gi**t **g**raph by **b**ranches|
alias gigb='git log --all --graph --decorate --oneline --simplify-by-decoration --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n"'

##BH |f|Simple find command to find given patterned files in current directory|
f ()
{
    find . -name "$@"
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


##BH |-|Function naming as (t)(clr)(t)(b) --> (true)(color)(text)(bold)|
##BH |-|tclrtb, tclrt. tclrbg are single argument functions which take one color code|
##BH |-|tclr and tclrb takes two arguments first one background and second one foreground|
##BH |-|tclre ends color coding. **All color codes to be given in hex format**|

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
	ccbglblue=$(echo -e "\033[48;2;89;255;249;38;2;0;0;0m")

	ccend=$(echo -e "\033[0m")
	/usr/bin/make "$@" 2>&1 | tee /tmp/buildlog | sed -E  -e "s%\b[Nn][Oo][Tt][Ee]\b%$ccbglblue&$ccend%g" -e "s%\b[Ee][Rr][Rr][Oo][Rr]\b|\b[Ee][Rr][Rr]\b%$ccbgred&$ccend%g" -e "s%\b[Ww][aA][rR][nN][iI][nN][gG]\b|\b[Ww][aA][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%\b[Ww][rR][nN]\b%$ccbgyellow&$ccend%g" -e "s%Entering%$ccbggreen>>>>>>>>>>>>>>>>&$ccend%g" -e "s%Leaving%$ccbgmagenta<<<<<<<<<<<<<<<<&$ccend%g"
	return ${PIPESTATUS[0]}
}
alias make=mmk

##BH |create_pkeys|create ssh keys for automatic ssh logins.|
create_pkeys()
{
    cd ~;
    ssh-keygen -t rsa
    cd -
}

##BH |dirdiff|Terminal based interactive directory diff tool using vim|
dirdiff()
{
    # Shell-escape each path:
    DIR1=$(printf '%q' "$1"); shift
    DIR2=$(printf '%q' "$1"); shift
    vim $@ -c "DirDiff $DIR1 $DIR2"
}

##BH |setup_ssh|Auto ssh login helper which set sshkeys to remote server, ex. `setup_ssh user@host`|
setup_ssh()
{
    if [ ! -f ~/.ssh/id_rsa.pub ]
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

##BH |uncrust| 'uncrust [file names or wild char]' format given files as per the found config.|
uncrust ()
{
    local local_proj_cfg="$(git rev-parse --show-toplevel)/.uncrustify.cfg"
    local cfg=""
    if [ -f  $local_proj_cfg ]
    then
        echo "found $local_proj_cfg, use it?[y/n]"
        read confirm
        if [ "$confirm" == "y" ]
        then
            cfg=$local_proj_cfg
        fi
    fi

    if [ -f ~/.uncrustify.cfg ]
    then
        echo "found config in home dir, use it?[y/n]"
        read confirm
        if [ "$confirm" == "y" ]
        then
            cfg="~/uncrustify.cfg"
        fi
    fi
    if [ "$cfg" != "" ]
    then
        echo "uncrustify --no-backup -c $cfg $@"
    else
        echo "No valid uncrustify config found."
    fi
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
      *.tar.xz)    tar xf $1  ;;
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
        local bil=$(echo $bi|awk -F'\\.\\.\\.' '{print $1}')
        echo -ne "${bil}" 
    fi
}

##BH |get_git_rb|Get git origin branch.|
get_git_rb() {
    local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g"| cut -d " " -f1)

    if [ "$bi" != "" ]
    then
        local bir=$(echo $bi|awk -F'\\.\\.\\.' '{print $2}')
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

    local right_color=6272a4
    local dirbg=bd93f9
    if [ "$USER" == "root" ]
    then
        right_color=cf658c
        dirbg=e31045
    fi
    # Mostly inside docker
    if [ "$USER" == "" ]
    then
        user="DOCKER on `whoami`"
        right_color=2d6187
        dirbg=28abb9
    fi

    local hst=$(hostname|cut -d"." -f1)
    local ts=$(date +"%d/%m/%Y %H:%M:%S")

    # Right prompt. Very light color, as it is very less important info.
    #pcolumns=`expr $COLUMNS - 5`
    pcolumns=$COLUMNS
    printf "\n"
    tclrt $right_color
    if [ "$grb" != "" ]
    then
        printf "%${pcolumns}s" "$gis $grb | $user@$hst | [$ts]"
    else
        printf "%${pcolumns}s" "$user@$hst | [$ts]"
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
        tclrb $right_color ffffff
        printf " %s " "$glb"
        tclre

        if [ $USE_PWR_FONTS == 1 ]
        then
            # separator with current background as foreground and next background as background.
            # powerline bulk arrow separator.
            tclrb $dirbg $right_color
            printf $PROMPT_SEP
            tclre
        fi
    fi

    tclrb $dirbg 000000
    printf " %s " "$d"
    tclre
    if [ $USE_PWR_FONTS == 1 ]
    then
        tclrt $dirbg
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

##BH |gh_rel|Get latest github release file from a repo `Usage gh_rel <repo name> <file regex pattern>`|
gh_rel()
{
    [ "$1" == "" -o "$2" == "" ] && echo "Usage gh_rel <repo name> <file regex pattern>" && return
    repo=$1
    file_pattern=$2
    curl -s https://api.github.com/repos/$repo/releases/latest | grep browser_download_url|cut -d: -f2-|grep -E "$file_pattern"|sed -e 's/\"//g' -e 's/^ //g'
}

##BH |install_nerd_font|Install any nerd font from |
install_nerd_font()
{
    [ "$1" == "" ] && echo "Give valid font name" && return
    pushd /tmp
    wget $(gh_rel ryanoasis/nerd-fonts $1)
    [ ! -f $1.zip ] && echo "Unable to download font $1" && popd && return
    [ -d $1 ] && rm -rf $1
    mkdir $1
    pushd $1
    unzip ../$1.zip
    [ ! -d ~/.fonts ] && mkdir ~/.fonts
    cp ./* ~/.fonts/
    popd
    rm -rf $1 $1.zip
    popd
    return
    fc-cache -f -v
}

##BH |gucfg|Global git user config|
gucfg()
{
    echo "This will overwrite existing global git configuration"
    local username
    local email
    read -p  "Enter user name > " username
    read -p "Enter email id > " email
    [ "$username" == "" ] && echo "Invalid username" && return
    [ "$email" == "" ] && echo "Invalid email" && return
    git config --global user.name "$username"
    git config --global user.email $email
    echo $username $email
}

##BH |lgucfg|Local git user config for repository level|
lgcfg()
{
    [ ! -d .git ] && echo "Execute this command from root directory of any git repository..." && return
    echo "This will overwrite existing local git configuration"
    local username
    local email
    read -p  "Enter user name > " username
    read -p "Enter email id > " email
    [ "$username" == "" ] && echo "Invalid username" && return
    [ "$email" == "" ] && echo "Invalid email" && return
    git config user.name "$username"
    git config user.email $email
    echo $username $email

    echo ""
}

PS1='`print_myprompt`\n$ '

drawline ()
{
    # printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' \U2015
    cols=$(tput cols)
    printf "\U2015"'%.s' $(eval "echo {1.."$(($cols))"}")
}

##BH |glow|Fill a pane(tmux) or split terminal with all white color,  might be useful if you dont have other light source|
glow()
{
    tclrbg ffffff
    lines=$(tput lines)
    for (( i = 0; i < $lines; i++ ))
    do
        printf "\n"
    done

}

# After reading several suggestions decided to not set this in bashrc.
# terminal should set this
# export TERM="xterm-256color"

# Loading all completions from devenv
for i in $(ls -A ~/devenv/build/bash_completions/)
do
    source ~/devenv/build/bash_completions/$i
done

export TASKRC=~/devenv/taskrc

alias g='BROWSER=w3m googler -n 7 -c en -l en'
source ~/devenv/bashcolors.sh

TICK="✓"
CROSS="✗"

DONE="🖖"
URGENT="🔥"
OVERDUE="👎"
DUETODAY="🔔"
DUETOMORROW="⏰"

# TaskWarrior integration
# Inspired by Paul Fenwick (https://gist.github.com/pjf)
function task_indicator {
    if [ `task +READY +OVERDUE count` -gt "0" ]; then
        echo "$OVERDUE"
    elif [ `task +READY +TODAY count` -gt "0" ]; then
        echo "$DUETODAY"
    elif [ `task +READY +TOMORROW count` -gt "0" ]; then
        echo "$DUETOMORROW"
    elif [ `task +READY urgency \> 10 count` -gt "0" ]; then
        echo "$URGENT"
    else
        echo "$DONE"
    fi
}

## TaskWarrior
## <https://taskwarrior.org/docs/>

# Declares an array of projects in bash
# The position in the array counts for the id and starts counting at 1
declare -a projects=('Home' 'Personal' 'Work');

# http://stackoverflow.com/a/16553351
# get length of an array
nrOfProjects=${#projects[@]}
urgencyPrio=4

# echo "Setting up TaskWarrior and TimeWarrior with ${nrOfProjects} projects..."
# echo "DONE = $DONE / URGENT = $URGENT / OVERDUE = $OVERDUE / DUETODAY = $DUETODAY  / DUETOMORROW = $DUETOMORROW"

# Loop will set up task next, task add, task log and timew start for all projects listed above
for (( i = 0; i < $nrOfProjects; i++ ));
do
    # echo "Project $i = ${projects[i]}"
    alias tn$i="task next project:${projects[i]} +READY"
    alias tnu$i="tn${i} urgency \> ${urgencyPrio}"
    alias ta$i="task add project:${projects[i]}"
    alias tl$i="task log project:${projects[i]}"
    alias twst$i="timew start ${projects[i]}"
done;

# General TaskWarrior commands
##BH |t| Show tasks|
alias t='task'
##BH |tn| Show next task|
alias tn='task next +READY'
##BH |tnu| Show next task urgency|
alias tnu="task next urgency \> ${urgencyPrio}"
##BH |ta| add task |
alias ta='task add'
##BH |trm| task delete|
alias trm='task delete'
##BH |td| task done|
alias td='task done'
##BH |ts| task start|
alias ts='task start'
##BH |tan| Annotate a Task|
alias tan='task annotate'
##BH |tl| Show task log|
alias tl='task log'
##BH |tac| Show active tasks|
alias tac='task active'
##BH |tap| Task add to personal project|
alias tap='task add project:Personal'
##BH |taw| Add task to work project|
alias taw='task add project:Work'

# TaskWarrior reports
# Tip: use `task timesheet` for a full report
##BH |tt| Show tasks completed today|
alias tt='task modified:today completed'
##BH |ty| Show tasks completed yesterday|
alias ty='task modified:yesterday completed'
##BH |tey| Show tasks completed after yesterday|
alias tey='task end.after:yesterday completed'
##BH |twork| Set context to work tasks|
alias twork='task context work'
##BH |tpers| Set context to personal tasks|
alias tpers='task context personal'
##BH |tclw| Show task I completed in the last week|
alias tclw='task end.after:today-1wk completed'

## TimeWarrior
##BH |twst| Start tracking time |
alias twst='timew start'
##BH |twc| Continue tracking time |
alias twc='timew continue'
##BH |twstop| Stop tracking time |
alias twstop='timew stop'
##BH |tws| This Week time summary |
alias tws='timew summary :week'
##BH |twlw| Last week time summary |
alias twlw='timew summary :lastweek'
##BH |twd| Day time summary |
alias twd='timew summary :day'

tsl ()
{
    color=""
    [[ "$@" == "" ]] && color=ff5d12 || color=00ff00
    tclrt $color
    drawline
    tclre
    for i in $(task _projects)
    do
        tclrt $color
        echo "Tasks $@ in project $i"
        tclre
        task project:$i $@
        tclrt $color
        drawline
        tclre
    done
}

wtsl ()
{
    while (true)
    do
        clear
        tsl "$@"
        sleep 5
    done
}

export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

hfzf ()
{
    export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --ignore"
    export FZF_DEFAULT_OPTS="--ansi"
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/devenv/fzfgit.sh

if [ -d ~/.pyenv ] 
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)" > /dev/null 2>&1
fi

export PATH=$PATH:~/devenv/bin/:~/devenv/build/fancydiff/diff-so-fancy/

export PATH=`printf %s "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

