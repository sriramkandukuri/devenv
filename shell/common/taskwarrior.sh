export TASKRC=~/devenv/taskwarrior/taskrc

source ~/devenv/shell/common/bashcolors.sh

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
for i in $(task _projects)
do
    # echo "Project $i = ${projects[i]}"
##BH |tnPN| Tag READY to next task in a project with name PN , you need to replace PN with actual project name|
    alias tn$i="task next project:$i +READY"
##BH |taPN| Add task to project with name PN , you need to replace PN with actual project name|
    alias ta$i="task add project:$i"
##BH |taPN| Mark a task to done in project with name PN , you need to replace PN with actual project name|
    alias td$i="task done project:$i"
##BH |trmPN| Delete task from project with name PN , you need to replace PN with actual project name|
    alias trm$i="task delete project:$i"
##BH |tlPN| Add task to project with name PN , you need to replace PN with actual project name|
    alias tl$i="task log project:$i"
##BH |twstPN| Start timewarrior for project, you need to replace PN with actual project name|
    alias twst$i="timew start $i"
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
##BH |twork| Set context to work tasks|
alias twork='task context work'
##BH |tpers| Set context to personal tasks|
alias tpers='task context personal'

# TaskWarrior reports
# Tip: use `task timesheet` for a full report
##BH |tts| Show task time sheet|
alias tts='task timesheet'
##BH |tt| Show tasks completed today|
alias tt='task modified:today completed'
##BH |ty| Show tasks completed yesterday|
alias ty='task modified:yesterday completed'
##BH |tey| Show tasks completed after yesterday|
alias tey='task end.after:yesterday completed'
##BH |tlw| Show task I completed in the last week|
alias tlw='task end.after:today-1wk completed'
##BH |tbdd|task burndown daily|
alias tbdd="task burndown.daily"
##BH |tbdw|task burndown weekly|
alias tbdw="task burndown.weekly"
##BH |tbdy|task burndown yearly|
alias tbdy="task burndown.yearly"

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

##BH |tsl| show tasks per project |
tsl ()
{
    local color=""
    local header=""
    local dclr=9fe6a0;
    local sclr=f55c47;
    local fg=000000
    local hbg=3242a4
    local hfg=fcf403
    case "$@" in
        *complete*)
            color=$dclr
            ;;
        *)
            color=$sclr
            ;;
    esac

    case "$@" in
        *modi*today*comp*)
            header="Tasks Completed TODAY"
            ;;
        *modi*yest*comp*)
            header="Tasks Completed Yesterday"
            ;;
        *end*yester*comp*)
            header="Tasks Completed after Yesterday"
            ;;
        *end*aft*1wk*comp*)
            header="Tasks Completed in last week"
            ;;
        *)
            header="Tasks $@"
            ;;
    esac
    tclrb $hbg $hfg
    ctxtf "$header"
    tclre
    echo;echo
    for i in $(task _projects)
    do
        tclrb $color $bg
        ctxtf "$i"
        tclre
        task project:$i $@
    done
}

##BH |wtsl| watch tasks per project |
wtsl ()
{
    while (true)
    do
        clear
        tsl "$@"
        sleep 5
    done
}

##BH |wtb|watch task burndown daily, weekly and monthly|
wtb ()
{
    while (true)
    do
        clear
        task burndown.daily
        sleep 20
        task burndown.weekly
        sleep 20
        task burndown.monthly
        sleep 20
    done
}

##BH |wtt| watch tasks|
alias wt='wtsl'
##BH |wtt| watch tasks completed today|
alias wtt='wtsl modified:today completed'
##BH |wty| Watch tasks completed yesterday|
alias wty='wtsl modified:yesterday completed'
##BH |wtey| Watch tasks completed after yesterday|
alias wtey='wtsl end.after:yesterday completed'
##BH |wtlw| Watch task I completed in the last week|
alias wtlw='wtsl end.after:today-1wk completed'

