##BH |tmux|Run `tmux` command with predefined env settings aliased to `EDITOR=nvim TERM=tmux-256color tmux -2 -u`|
alias tmux="EDITOR=nvim TERM=tmux-256color tmux -2 -u"
##BH |rnp|Sets a titile which inturn renames a pane in tmux|
rnp()
{
    if [ "$1" = "" ]
    then
        printf '\033]2;%s\033\\' 'NO PANE TITLE'
    else
        printf '\033]2;%s\033\\' $1
    fi
}
##BH |tm|Open new tmux session with given name, or attach if its already exist, if used first time opens resurrected tmux sessions and connect them|
tm()
{
    local sess=$(cat ~/.tmux/resurrect/last | grep "^state" | tr '\t' ' ' | cut -d" " -f2)
    if [ "$sess" != "" ];then
        tmux has -t $sess || tmux
    fi
    if [ "$1" == "" ]
    then
        tmux attach -d
    else
        tmux new -AD -s "$@"
    fi
}
##BH |tml|list currently running tmux sessions|
alias tml="tmux ls"
##BH |vtm|Open tmux custom config provided by this repository for editing in vim|
alias vtm="vim ~/.devenv_tmux.conf"
##BH |tmk|Kill tmux server and kill all processes having `tmux` in their command|
alias tmk="tmux kill-server; kill -9 \$(ps -eaf|grep tmu[x] | sed 's/  */ /g' | cut -d\" \" -f2)"
##BH |tmks|Kill session with given name|
alias tmks="tmux kill-session -t"

##BH |ftwind|Find tmux windows in popup|
ftwind ()
{
    GREEN='\033[00;32m'
    RESTORE='\033[0m'

    # Get information about windows from tmux
    windows_str=$(tmux list-windows -F '#I #{pane_current_path} #{window_name} #{window_active}')

    # Process windows_str
    windows=''
    delim=''
    actives=()
    nums=()
    while read -r line; do
       line_array=($line)

       num=${line_array[0]}
       dir_name=$(basename ${line_array[1]})
       name=${line_array[2]}
       active=${line_array[3]}

       # Pad num
       [ "$num" -le "9" ] && num="$num "

       # Change color and add * if active
       if [ "$active" -eq "1" ]
       then
          actives+=("*")
          nums+=("$GREEN$num$RESTORE")
       else
          actives+=(" ")
          nums+=("$num")
       fi

       # Create output line
       out=$(echo -e "$name\t$dir_name")

       # Add to windows string
       windows=$(printf '%s%s%s' "$windows" "$delim" "$out")

       # So that join works
       delim=$'\n'
    done <<< "$windows_str"

    # Align on columns
    windows=$(column -s $'\t' -t <<< "$windows")

    # Split by newlines
    IFS=$'\n' read -rd '' -a window_arr <<<"$windows"

    # Add * and number at beginning, as these aren't handled correctly by column
    # command
    windows=''
    delim=''
    for (( i=0; i<${#window_arr[*]}; ++i))
    do
       out=$(echo -e "${actives[$i]} ${nums[$i]} ${window_arr[$i]}")
       windows=$(printf '%s%s%s%s' "$windows" "$delim" "$out")
       delim=$'\n'
    done

    # Run fzf and check result
    target=$(echo "$windows" | fzf-tmux -p --reverse --ansi)
    res=$?
    [ "$res" -eq "130" ] && exit 0
    [ "$res" -eq "0" ] || exit $res

    # Extract window number, handling * correctly
    target_window=$(echo "$target" | cut -d' ' -f2)
    [ "$target_window" = "" ] && \
       target_window=$(echo "$target" | cut -d' ' -f3)

    # Select window
    tmux select-window -t $target_window
}

##BH |ftpanes|Find all panes on server using fzf and switch to the selected one|
ftpanes()
{
    local tmout=`tmux list-panes -a -F "#{p10:session_name} #{p20:window_name} #{p3:pane_index} #T _:_ #S:#I.#P"`
    local sel=`echo "$tmout" | awk -F ' _:_ ' '{print $1}'| fzf`

    pane=`echo "$tmout"|grep "$sel"|awk -F' _:_ ' '{print $2}'`
    if [ "$pane" != "" ]; then
        tmux switch-client -t "$pane"
    fi
}
