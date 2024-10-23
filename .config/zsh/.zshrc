#!/bin/zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
setopt autocd
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install

# Completions
source ~/.zshcompletion

# Node Version Manager
# source /usr/share/nvm/init-nvm.sh

# Use nvim to read man pages
compdef vman="man"

# Aliases
source ~/.config/zsh/.zshalias

# Suggestions and syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source ~/.fzf.zsh

# Binding some keys
source ~/.config/zsh/.zshbinds

eza --icons

# Zoxide
eval "$(zoxide init zsh)"

# PS1
# eval "$(starship init zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
