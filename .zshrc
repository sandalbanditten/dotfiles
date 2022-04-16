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
bindkey '^[[H'  beginning-of-line # Home
bindkey '^[[4~' end-of-line       # End
bindkey '^[h'   backward-word     # Alt + h
bindkey '^[[P'  delete-char       # Delete
bindkey '^V'    fzf-cd-widget
bindkey '^H'    backward-char
bindkey '^J'    down-line-or-history
bindkey '^K'    up-line-or-history
bindkey '^L'    forward-char
bindkey '^E'    clear-screen
bindkey '^[H'   beginning-of-line
bindkey '^[L'   end-of-line
bindkey '^[^?'  backward-kill-word
bindkey '^[^H'  kill-whole-line
bindkey '^[l'   forward-word
bindkey '^[u'   down-case-word
bindkey -s '^N' '^[^Hcd .. && exa --icons^M'
bindkey -s '^[e' '^[Hc ; ^[L'
bindkey -s '^[v' 'cd^M^V'
bindkey -r '^[f'

exa --icons

# PS1
eval "$(starship init zsh)"
