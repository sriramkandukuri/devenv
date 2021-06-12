PS1='`print_myprompt`\n$ '

bashrc_sourced=$(stat -c %Y ~/.bashrc)
bashdevrc_sourced=$(stat -c %Y ~/devenv/shell/bash/devenv_bashrc)

prompt_command='
   test $(stat -c %y ~/.bashrc) -ne $bashrc_sourced && source ~/.bashrc;
   test $(stat -c %y ~/devenv/shell/bash/devenv_bashrc) -ne $bashdevrc_sourced && source ~/.bashrc
'

