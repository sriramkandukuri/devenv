if [ $USE_PWR_FONTS = 1 ]
then
    PROMPT_SEP="\uE0B0"
fi

# fancy prompt with git details time stamp directory, git dirty status etc..
print_myprompt() {

    local lcs=$?
    local d=`dirs`
    local glb=`get_git_lb "%s"`
    local grb=`get_git_rb`
    local gls=`get_git_ls`
    local gis=`get_git_is`
    local gsc=`get_git_sc`

    local user=$USER

    local right_color=6272a4
    local dirbg=bd93f9
    if [ "$USER" = "root" ]
    then
        right_color=cf658c
        dirbg=e31045
    fi
    # Mostly inside docker
    if [ "$USER" = "" ]
    then
        user="DOCKER on `whoami`"
        right_color=2d6187
        dirbg=28abb9
    fi

    local hst=$(hostname|cut -d"." -f1)
    local ts=$(date +"%d/%m/%Y %H:%M:%S")

    # Right prompt. Very light color, as it is very less important info.
    printf "\n"
    tclrt $right_color
    if [ "$grb" != "" ]
    then
        rtxt "$gis [stashes:$gsc] $grb | $user@$hst | [$ts]"
    else
        rtxt "$user@$hst | [$ts]"
    fi
    tclre
    printf "\n"

    # Left prompt.

    # Git local status color setting green if clean red if changed with porcelain markings
    if [ "$gls" != "" ]
    then
        if [ "$gls" = "clean" ]
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

        if [ $USE_PWR_FONTS = 1 ]
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
    if [ $USE_PWR_FONTS = 1 ]
    then
        tclrt $dirbg
        printf $PROMPT_SEP
        tclre
    fi

    # last command status. green if 0 red if error.
    if [[ "$lcs" = "130" ]]
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
