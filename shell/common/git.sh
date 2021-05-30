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
##BH |gibd|git branch delete|
alias gibd="git branch -d"
##BH |gibD|git branch force delete |
alias gibD="git branch -D"
##BH |gibda|git all branches delete except current one|
alias gibda='git branch -d $(git branch |grep -v "^*")'
##BH |gibDa|git all branches force delete except current one|
alias gibDa='git branch -D $(git branch |grep -v "^*")'


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
    # local bi=$(git status -bs 2> /dev/null|head -1|sed -e "s/## //g" | cut -d " " -f1)

    # if [ "$bi" != "" ]
    # then
    #     local bil=$(echo $bi|awk -F'\\.\\.\\.' '{print $1}')
    #     echo -ne "${bil}"
    # fi
	local g="$(git rev-parse --git-dir 2>/dev/null)"
	if [ -n "$g" ]; then
		local r
		local b
		if [ -d "$g/rebase-apply" ]
		then
			if test -f "$g/rebase-apply/rebasing"
			then
				r="|REBASE"
			elif test -f "$g/rebase-apply/applying"
			then
				r="|AM"
			else
				r="|AM/REBASE"
			fi
			b="$(git symbolic-ref HEAD 2>/dev/null)"
		elif [ -f "$g/rebase-merge/interactive" ]
		then
			r="|REBASE-i"
			b="$(cat "$g/rebase-merge/head-name")"
		elif [ -d "$g/rebase-merge" ]
		then
			r="|REBASE-m"
			b="$(cat "$g/rebase-merge/head-name")"
		elif [ -f "$g/MERGE_HEAD" ]
		then
			r="|MERGING"
			b="$(git symbolic-ref HEAD 2>/dev/null)"
		else
			if [ -f "$g/BISECT_LOG" ]
			then
				r="|BISECTING"
			fi
			if ! b="$(git symbolic-ref HEAD 2>/dev/null)"
			then
				if ! b="$(git describe --exact-match HEAD 2>/dev/null)"
				then
					b="$(cut -c1-7 "$g/HEAD")..."
				fi
			fi
		fi

		if [ -n "${1-}" ]; then
			printf "$1" "${b##refs/heads/}$r"
		else
			printf " (%s)" "${b##refs/heads/}$r"
		fi
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

##BH |get_git_sc|Get git stash count|
get_git_sc ()
{
    local sc=$(git stash list 2> /dev/null|wc -l)
    if [ "$sc" != "" ]
    then
        echo "$sc"
    fi
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

