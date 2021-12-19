##BH |devtasks|Dashboard tmux window for task management with taskwarrior|
devtasks ()
{
    tmux rename-window TASKS
    local SNAME=$(tmux display-message -p "#S")
    local WNAME=$(tmux display-message -p "#W")
    local PFX="$SNAME:$WNAME"
    # tmux select-pane -T INPROGRESS
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
    rnp CONTROL
    tmux send-keys -t $PFX.1 "wt" Enter
    tmux send-keys -t $PFX.2 "wtb" Enter
    tmux send-keys -t $PFX.4 "wtey" Enter
}

##BH |devtaskskill|Kill Dashboard tmux window for task management with taskwarrior|
devtaskskill ()
{
    tmux rename-window TASKS
    local SNAME=$(tmux display-message -p "#S")
    local WNAME=$(tmux display-message -p "#W")
    local PFX="$SNAME:$WNAME"
    tmux send-keys -t $PFX.1 "C-c" Enter
    tmux send-keys -t $PFX.2 "C-c" Enter
    tmux send-keys -t $PFX.4 "C-c" Enter
    tmux kill-pane -a
}
