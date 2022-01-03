##BH |devtask|Dashboard tmux window for task management with taskwarrior|
devtask ()
{
    tmux rename-window TASKS
    local SNAME=$(tmux display-message -p "#S")
    local WNAME=$(tmux display-message -p "#W")
    local PFX="$SNAME:$WNAME"
    # tmux select-pane -T INPROGRESS
    if [ "$1" != "1" ];then
        rnp INPROGRESS
        tmux split-window -h
        rnp BURNDOWN
        tmux split-window -h
        rnp DONE
        tmux select-pane -L
        tmux select-pane -L
        tmux resize-pane -x 33%
        tmux select-pane -R
        tmux resize-pane -x 33%
        tmux select-pane -R
        tmux resize-pane -x 33%
        tmux select-pane -L
        tmux split-window -v
        tmux resize-pane -y 25%
        rnp CONTROL
    fi
    tmux send-keys -t $PFX.1 "wt" Enter
    tmux send-keys -t $PFX.2 "wtb" Enter
    tmux send-keys -t $PFX.4 "wtey" Enter
}

##BH |devtaskkill|Kill Dashboard tmux window for task management with taskwarrior|
devtaskkill ()
{
    tmux rename-window TASKS
    local SNAME=$(tmux display-message -p "#S")
    local WNAME=$(tmux display-message -p "#W")
    local PFX="$SNAME:$WNAME"
    tmux send-keys -t $PFX.1 "C-c"
    tmux send-keys -t $PFX.2 "C-c"
    tmux send-keys -t $PFX.4 "C-c"
    if [ "$1" != "1" ];then
        tmux kill-pane -a
    fi
}
##BH |devtaskstop|Stop Dashboard tmux window for task management with taskwarrior|
devtaskstop()
{
    devtaskkill 1
}

##BH |devtaskrelaod|Restart tracking tasks in Dashboard tmux window for task management with taskwarrior|
devtaskreload()
{
    devtask 1
}
