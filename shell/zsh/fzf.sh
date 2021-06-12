# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nxa06680/devenv/build/fzf/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nxa06680/devenv/build/fzf/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nxa06680/devenv/build/fzf/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source /home/nxa06680/devenv/build/fzf/fzf/shell/key-bindings.zsh
source ~/devenv/build/fzf/fzf/shell/completion.zsh
source ~/devenv/shell/common/fzfgit.sh
