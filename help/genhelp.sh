#!/bin/bash

BHELP=~/devenv/help/bashhelp.md
TMHELP=~/devenv/help/tmuxhelp.md
VHELP=~/devenv/help/vimhelp.md

> $BHELP
> $TMHELP
> $VHELP

printf "## Prompt\n\n" >> $BHELP
printf "This bash environment provides prompt with 2 segments\n\n" >> $BHELP
printf "**Left portion** \n1. short form of git status and git local branch name if current working directory is subdirectory/maindirectory of a git repo\n" >> $BHELP
printf "2. Current working directory path\n" >> $BHELP
printf "3. Status code of previously executed command\n\n" >> $BHELP

printf "**Right portion** \n1. Remote name/Remote branch name, if current working directory is either git repo or subdirectory of a git repo.\n" >> $BHELP
printf "2. User name and host name.\n" >> $BHELP
printf "3. Date and time stamp. This can be used for observing time taken by any command\n\n" >> $BHELP


printf "## Bash Shortcuts\n\nPlease find below shortcuts provided by bashrc.\n\n" >> $BHELP
echo "|Shortcut|Description|" >> $BHELP
echo "|---|---|" >> $BHELP
grep "^##BH" bashrc | cut -d" " -f2- >> $BHELP

printf "## Tmux Shortcuts\n\nPlease find below shortcuts provided for tmux.\n\n" >> $TMHELP

for f in $(grep -nrl "^##TH" ~/devenv/tmux/*)
do
    h=$(basename $f|cut -d'.' -f1)
    h=$(echo ${h^}|tr '_' ' ')
    echo "### $h" >> $TMHELP
    echo >> $TMHELP

    echo "|Shortcut|Description|" >> $TMHELP
    echo "|---|---|" >> $TMHELP
    grep "^##TH" $f | cut -d" " -f2- >> $TMHELP
    echo >> $TMHELP
done


printf "## VIM/nvim Shortcuts\n\nPlease find below shortcuts provided for vim.\n\n" >> $VHELP

for f in $(grep -nrl "^\"\"VH" ~/devenv/vim/*)
do
    h=$(basename $f|cut -d'.' -f1)
    h=$(echo ${h^}|tr '_' ' ')
    echo "### $h" >> $VHELP
    echo >> $VHELP

    echo "|Shortcut|Description|" >> $VHELP
    echo "|---|---|" >> $VHELP
    grep "^\"\"VH" $f | cut -d" " -f2- >> $VHELP
    echo >> $VHELP
done
