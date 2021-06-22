## Prompt

This bash environment provides prompt with 2 segments

**Left portion** 
1. short form of git status and git local branch name if current working directory is subdirectory/maindirectory of a git repo
2. Current working directory path
3. Status code of previously executed command

**Right portion** 
1. Remote name/Remote branch name, if current working directory is either git repo or subdirectory of a git repo.
2. User name and host name.
3. Date and time stamp. This can be used for observing time taken by any command

## Bash Shortcuts

Please find below shortcuts provided by bashrc.

### Fzf

|Shortcut|Description|
|---|---|
|hfzf|fzf with hidden files enabled|

### Devenv management

|Shortcut|Description|
|---|---|
|vdbash|To edit `bashrc` provided by this repository, **This works only if this repo cloned to home directory.**|
|genhelp|Generate help documents of devenv|
|tmhelp|Show tmux shortcuts help|
|bhelp|Show bashrc shortcuts help|
|vhg|Show help of any command from vim help|
|vhg|Show help of any query from vim help|
|vhelp|Show custom vim shortcuts help|

### Cscope

|Shortcut|Description|
|---|---|
|csd|Open cscope with available cscope files in current directory|
|cs|Create cscope db and open cscope. This also takes directories as arguments to which cscopedb need to be created.|
|csf|Similar to above `cs` but removes all the cscope db files before creating new set of files. This can used to refresh the db if source is changed.|

### Tmux

|Shortcut|Description|
|---|---|
|tmux|Run `tmux` command with predefined env settings aliased to `EDITOR=nvim TERM=tmux-256color tmux -2 -u`|
|tmn|Open new tmux session with given name, by default it opens first window with 3 vertical panes, **Not giving argument causes unwanted behavior**|
|rnp|Sets a titile which inturn renames a pane in tmux|
|tma|Attach to running tmux session|
|tml|list currently running tmux sessions|
|vtm|Open tmux custom config provided by this repository for editing in vim|
|tmk|Kill tmux server and kill all processes having `tmux` in their command|
|tmks|Kill session with given name|
|ftwind|Find tmux windows in popup|

### Tools

|Shortcut|Description|
|---|---|
|d2u|Dos to unix command |
|gettimestamp|Prints time in `YYYYMMDD_hhmmss` format. Usefull for generating any filenames based on timestamp|
|gettimestampbb|Prints time in `YYYY.MM.DD-hh:mm:ss` format. Usefull for generating any filenames based on timestamp|
|getsource|Get any git repo as a tar ball witout git information.|
|fsw|Find any swap files in current directory|
|hugelist|Find top 5 space consuming files or directories|
|cdsize|Current directory size|
|?|Get details of an alias/command example "? fsw"|
|countdown|Countdown timer become handy to track time sometimes.ex. `countdown 60` `countdown $((2*60*60))` `countdown $((24*60*60))`|
|stopwatch|Stopwatch kind of display on terminal|
|man|Similar to man but presented colorful|
|bkp|Just create a backup of file/directory with appending timestamp to its name.|
|tarbkp|Just create a backup of file/directory with timestamp as tarball.|
|myecho|echo command wrapper with colored errors,warnings and highlighted directory entries and exits.|
|mmk|Make command wrapper with colored errors,warnings and highlighted directory entries and exits.|
|batch_mv|`batch_mv x y` Renames files containing `x` in their names and replaces `x` with `y`|
|batch_rename|`batch_rename x y` Renames files containing `x` in their names and replaces `x` with `y`. This also replaces file contents having `x` to `y`|
|ex|archive extractor usage: ex <file>|
|glow|Fill a pane(tmux) or split terminal with all white color,  might be useful if you dont have other light source|
|vitmp|Create and open temporary file in vim|
|clean_tmp|Remove all temporary files created by `mktemp` command|
|dirdiff|Terminal based interactive directory diff tool using vim|
|cheat|Show help from cheat.sh|
|uncrust| 'uncrust [file names or wild char]' format given files as per the found config.|

### Text formatting

|Shortcut|Description|
|---|---|
|printcolors|Test terminal supports 256 colors or not. Also outputs color numbers.|
|rgbtest|Test your terminal supports rgb colors or not and print them|
|-|Function naming as (t)(clr)(t)(b) --> (true)(color)(text)(bold)|
|-|tclrtb, tclrt. tclrbg are single argument functions which take one color code|
|-|tclr and tclrb takes two arguments first one background and second one foreground|
|-|tclre ends color coding. **All color codes to be given in hex format**|
|tclrtb|Color only foreground and set text to bold|
|tclrt|Color only foreground|
|tclrbg|Color only background|
|tclrb|Color background and foreground and make text to bold|
|tclrb|Color background and foreground.|
|tclre|Ends color coding.|
|print_u8charset|Print whole UTF-8 char set. Not working correctly as there are several unwanted characters|
|rtxt|print given arguments right aligned|
|ctxt|print given arguments center aligned|
|ctxtf|print given arguments center aligned with trailing spaces(f)|
|drawline|print horizontal line useful for screen seperation in some scripts|

### Ssh management

|Shortcut|Description|
|---|---|
|create_pkeys|create ssh keys for automatic ssh logins.|
|setup_ssh|Auto ssh login helper which set sshkeys to remote server, ex. `setup_ssh user@host`|

### Git

|Shortcut|Description|
|---|---|
|gid|git diff|
|gids|git diff with staged changes|
|gidw|git diff ignoring white space|
|pgid|git diff open in vim|
|pgids|git diff with staged changes opens in vim|
|pgidw|git diff ignoring white space opens in vim|
|vgid|git diff open in vim|
|vgids|git diff with staged changes opens in vim|
|vgidw|git diff ignoring white space opens in vim|
|gicl|git clone|
|gigt|git get theirs|
|gigo|git get ours|
|gipsf|git push force|
|gipsof|git push origin force|
|gips|git push|
|gipso|git push origin|
|gipla|git pull all|
|gipl|git pull|
|gir|git rebase|
|girc|git rebase continue|
|girs|gir rebase skip|
|gira|gir rebase abort|
|gia|git add|
|gis|git status|
|gich|git checkout|
|gicb|git checkour new branch with given name|
|gib|git branch|
|giba|git show all branches including remotes|
|gibd|git branch delete|
|gibD|git branch force delete |
|gibda|git all branches delete except current one|
|gibDa|git all branches force delete except current one|
|gico|git commit with adding signature|
|gil|git log|
|gilo|git log in oneline format|
|gilol | awesome git log replacement|
|gilod |git log same as above, but ISO date|
|gilobi | git log using **b**uild-**i**n standards|
|gilobc | git log to show **b**ranches and their last **c**ommits|
|gigl| **gi**t **g**raph by **l**og|
|gigb| **gi**t **g**raph by **b**ranches|
|get_git_ls|Get git local status|
|get_git_is|Get git index status information about ahead or behind|
|get_git_lb|Get git local branch|
|get_git_rb|Get git origin branch.|
|get_git_sc|Get git stash count|
|gucfg|Global git user config|
|lgucfg|Local git user config for repository level|

### Taskwarrior

|Shortcut|Description|
|---|---|
|tnPN| Tag READY to next task in a project with name PN , you need to replace PN with actual project name|
|taPN| Add task to project with name PN , you need to replace PN with actual project name|
|taPN| Mark a task to done in project with name PN , you need to replace PN with actual project name|
|trmPN| Delete task from project with name PN , you need to replace PN with actual project name|
|tlPN| Add task to project with name PN , you need to replace PN with actual project name|
|twstPN| Start timewarrior for project, you need to replace PN with actual project name|
|t| Show tasks|
|tn| Show next task|
|tnu| Show next task urgency|
|ta| add task |
|trm| task delete|
|td| task done|
|ts| task start|
|tan| Annotate a Task|
|tl| Show task log|
|tac| Show active tasks|
|tap| Task add to personal project|
|taw| Add task to work project|
|twork| Set context to work tasks|
|tpers| Set context to personal tasks|
|tts| Show task time sheet|
|tt| Show tasks completed today|
|ty| Show tasks completed yesterday|
|tey| Show tasks completed after yesterday|
|tlw| Show task I completed in the last week|
|tbdd|task burndown daily|
|tbdw|task burndown weekly|
|tbdy|task burndown yearly|
|twst| Start tracking time |
|twc| Continue tracking time |
|twstop| Stop tracking time |
|tws| This Week time summary |
|twlw| Last week time summary |
|twd| Day time summary |
|tsl| show tasks per project |
|wtsl| watch tasks per project |
|wtb|watch task burndown daily, weekly and monthly|
|wtt| watch tasks|
|wtt| watch tasks completed today|
|wty| Watch tasks completed yesterday|
|wtey| Watch tasks completed after yesterday|
|wtlw| Watch task I completed in the last week|

### Nerdfont

|Shortcut|Description|
|---|---|
|install_nerd_font|Install any nerd font from |

### General

|Shortcut|Description|
|---|---|
|v|Opens nvim|
|vi|Opens nvim|
|nv|Opens nvim|
|vim|Opens nvim|
|ovim|Opens old/original vim instead of nvim|
|vbash|To edit `.bashrc` inside user home directory|
|sbash|Source bash environment again after unaliasing all shortcuts|
|l|List files with colors, show sizes in readable format and sort to print latest file at last |
|cl|List files with colors, show sizes in readable format and sort to print latest file at last |
|lv|List files with colors, show sizes in readable format and sort by name |
|ls|List files with colors |
|mygrep|Grep recursive, prints numbers, excludes binaries, files with extensions .o, .o.cmd, .d, .htm, .map, .xsl files with names cscope*, *tags |
|myrg|Grep recursive, prints numbers, excludes binaries, files with extensions .o, .o.cmd, .d, .htm, .map, .xsl files with names cscope*, *tags |
|ai| shortcut to apt-get install|
|sau| shortcut to sudo apt-get update and upgrade|
|sai| shortcut to sudo apt-get install|
|cho|Make current user as owner for all given files|
|chx|Give executable permission to given files|
|r|Refresh command, if some programs delte and recreate some directory you can just press r to refresh it. works mostly ;)|
|f|Simple find command to find given patterned files in current directory|
|lf|List file with fullpath usefull while remote copying.|
|mkcd|Make directory and cd to it|

### Debugging

|Shortcut|Description|
|---|---|
|getsymbolo|Debugging helper find any symbol from compile .o files in any subdirectory.|

### Github

|Shortcut|Description|
|---|---|
|gh_rel|Get latest github release file from a repo `Usage gh_rel <repo name> <file regex pattern>`|

