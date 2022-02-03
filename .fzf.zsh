# Setup fzf
# ---------
if [[ ! "$PATH" == */home/notroot/Software/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/notroot/Software/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/notroot/Software/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/notroot/.fzfbinds.zsh"
