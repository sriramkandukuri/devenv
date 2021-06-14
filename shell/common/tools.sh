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

##BH |man|Similar to man but presented colorful|
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;43;30m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
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
      *.tar.xz)    tar xf $1  ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

verifydockerconfig()
{
    echo $1
    for i in $(cat ~/dockerreqconfig.txt |grep "^CONFIG_" | cut -d: -f1); do grep "$i " $1 ; done
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

# Manage temporary files
##BH |vitmp|Create and open temporary file in vim|
vitmp()
{
    vim $(mktemp)
}
##BH |clean_tmp|Remove all temporary files created by `mktemp` command|
alias clean_tmp="rm -rf /tmp/tmp.*"

##BH |dirdiff|Terminal based interactive directory diff tool using vim|
dirdiff()
{
    # Shell-escape each path:
    DIR1=$(printf '%q' "$1"); shift
    DIR2=$(printf '%q' "$1"); shift
    vim $@ -c "DirDiff $DIR1 $DIR2"
}

##BH |cheat|Show help from cheat.sh|
cheat ()
{
    curl cht.sh/$@
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
        if [ "$confirm" = "y" ]
        then
            cfg=$local_proj_cfg
        fi
    fi

    if [ -f ~/.uncrustify.cfg ]
    then
        echo "found config in home dir, use it?[y/n]"
        read confirm
        if [ "$confirm" = "y" ]
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
