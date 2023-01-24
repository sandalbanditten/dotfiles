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

# Use nvim to read man pages
compdef vman="man"

# Aliases
source ~/.zshalias

# Suggestions and syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source ~/.fzf.zsh

# Binding some keys
source ~/.zshbinds

exa --icons

# Zoxide
eval "$(zoxide init zsh)"

# PS1
eval "$(starship init zsh)"
