#!/bin/bash

> bashhelp.md
> tmuxhelp.md
> vimhelp.md

printf "## Prompt\n\n" >> bashhelp.md
printf "This bash environment provides prompt with 2 segments\n\n" >> bashhelp.md
printf "**Left portion** \n1. short form of git status and git local branch name if current working directory is subdirectory/maindirectory of a git repo\n" >> bashhelp.md
printf "2. Current working directory path\n" >> bashhelp.md
printf "3. Status code of previously executed command\n\n" >> bashhelp.md

printf "**Right portion** \n1. Remote name/Remote branch name, if current working directory is either git repo or subdirectory of a git repo.\n" >> bashhelp.md
printf "2. User name and host name.\n" >> bashhelp.md
printf "3. Date and time stamp. This can be used for observing time taken by any command\n\n" >> bashhelp.md


printf "## Bash Shortcuts\n\nPlease find below shortcuts provided by bashrc.\n\n" >> bashhelp.md
echo "|Shortcut|Description|" >> bashhelp.md
echo "|---|---|" >> bashhelp.md
grep "^##BH" bashrc | cut -d" " -f2- >> bashhelp.md
vim bashhelp.md +'/^|' +TableModeRealign +wqall

printf "## Tmux Shortcuts\n\nPlease find below shortcuts provided for tmux.\n\n" >> tmuxhelp.md
echo "|Shortcut|Description|" >> tmuxhelp.md
echo "|---|---|" >> tmuxhelp.md
grep "^##TH" mytmux.conf | cut -d" " -f2- >> tmuxhelp.md
vim tmuxhelp.md +'/^|' +TableModeRealign +wqall

printf "## VIM/nvim Shortcuts\n\nPlease find below shortcuts provided for vim.\n\n" >> vimhelp.md
echo "|Shortcut|Description|" >> vimhelp.md
echo "|---|---|" >> vimhelp.md
grep "^\"\"VH" myvimrc | cut -d" " -f2- >> vimhelp.md
vim vimhelp.md +'/^|' +TableModeRealign +wqall
