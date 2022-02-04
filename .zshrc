# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
setopt autocd
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/notroot/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Personal addition (completions):
. ~/.zshcompletion

# Use nvim to read man pages
compdef vman="man"

# Aliases
alias :q="exit"
alias acc="arduino-cli compile --fqbn arduino:avr:uno"
alias anew="arduino-cli sketch new"
alias aup="arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno"
alias b="bat --color=always"
alias bt="btop"
alias c="clear"
alias cal="cal -wm"
alias cam="mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0"
alias cast="ffmpeg -f x11grab -s 2560x1600 -i :0.0 ~/Documents/Screencasts/screencast$(date | sed 's/[^0-9]//g').mp4"
alias clip="xclip -selection clipboard"
alias cnf="clear && neofetch"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cp="cp -vi"
alias ct="rm ~/.local/share/Trash/files/*"
alias df="df -h"
alias ds="doas"
alias e="nvim -p"
alias eO="nvim -O"
alias eX="nvim ~/.XCompose"
alias ebsp="nvim ~/.config/bspwm/bspwmrc"
alias ec="cd ~/.config && xt && nvim ~/.config -c 'set nu relativenumber'"
alias ed="nvim -d"
alias edm="cd ~/Code/Software/suckless/dmenu && xt && nvim ~/Code/Software/suckless/dmenu/config.def.h"
alias edwm="cd ~/Code/Software/suckless/dwm && xt && nvim ~/Code/Software/suckless/dwm/config.def.h"
alias eenv="nvim ~/.zshenv"
alias ef="nvim \"\$(fzf --preview 'bat --color=always --line-range :64 {}')\""
alias ehk="nvim ~/.config/sxhkd/sxhkdrc"
alias eo="nvim -o"
alias epb="nvim ~/.config/polybar/config.ini"
alias epi="nvim ~/.config/picom/picom.conf"
alias es="cd ~/Code/Scripts/ && nvim \"\$(fzf)\" && xt"
alias esls="cd ~/Code/Software/suckless/slstatus && xt && nvim ~/Code/Software/suckless/slstatus/config.def.h"
alias est="cd ~/Code/Software/suckless/st && xt && nvim ~/Code/Software/suckless/st/config.def.h"
alias etab="cd ~/Code/Software/suckless/tabbed && xt && nvim ~/Code/Software/suckless/tabbed/config.def.h"
alias ev="cd ~/.config/nvim/ && xt && nvim ~/.config/nvim/init.vim"
alias ex="nvim ~/.xinitrc"
alias ez="nvim ~/.zshrc"
alias eze="nvim ~/.zshenv"
alias ezp="nvim ~/.zprofile"
alias f="fzf --height 30% --preview 'bat --color=always --line-range :64 {}'"
alias fmake="clear && make clean && make && make install.main"
alias fortune="fortune -a"
alias ga="cd ~/Code/Arduino/proj && xt"
alias gdm="cd ~/Code/Software/suckless/dmenu && xt"
alias gdwm="cd ~/Code/Software/suckless/dwm && xt"
alias getiso="xdg-open 'http://mirrors.dotsrc.org/archlinux/iso/2022.02.01/archlinux-2022.02.01-x86_64.iso'"
alias gia="git add"
alias cia="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add"
alias gic="git commit -m"
alias cic="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m"
alias gid="git diff"
alias cid="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff"
alias gil="git log"
alias cil="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME log"
alias gip="git push"
alias cip="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push"
alias gir="git rm"
alias cir="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME rm"
alias gis="git status"
alias cis="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status"
alias gsls="cd ~/Code/Software/suckless/slstatus && xt"
alias gst="cd ~/Code/Software/suckless/st && xt"
alias gtab="cd ~/Code/Software/suckless/tabbed && xt"
alias gv="cd ~/.config/nvim/ && xt"
alias imv="imv -b '#2e3440'"
alias ip="ip -c=auto"
alias m="vman"
alias makeavr="cp ~/Code/Arduino/lib/share/* . && mkdir ./.vim && cp ~/Code/Arduino/lib/share/.vim/coc-settings.json ./.vim/coc-settings.json"
alias makec="cp ~/Code/C/share/* ."
alias makehs="cp ~/Code/HS/share/* ."
alias makepkg="doas printf '' ; makepkg"
alias mv="mv -vi"
alias nf="neofetch"
alias nmcli="nmcli -p"
alias pml="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pmr="doas printf '' ; doas pacman -Rns"
alias pms="doas printf '' ; doas pacman -S"
alias pmss="doas printf '' ; doas pacman -Ss"
alias pmu="doas printf '' ; doas pacman -Syyuu"
alias pt="pactree -c"
alias py="python"
alias q="exit"
alias rcam="ffmpeg -f v4l2 -video_size 1920x1080 -i /dev/video0 -c:v libx264 -preset ultrafast ~/Documents/Camera/$(date | sed 's/[^0-9]//g').mp4"
alias sl="doas cp config.def.h config.h && doas make clean install"
alias t="nvim ~/Documents/TODO.md"
alias tcl="rm *.toc ; rm *.out ; rm *.fls ; rm *.log ; rm *.aux ; rm *.synctex.gz ; rm *.fdb_latexmk ; return 0"
alias tx="exa --icons ~/.local/share/Trash/files"
alias u="unarch"
alias x="exa --icons"
alias xa="exa --icons --tree --level=1 --all"
alias xal="exa --icons --tree --level=1 --all --long"
alias xl="exa --icons --tree --level=1 --long"
alias xla="exa --icons --tree --level=1 --all --long"
alias xr="exa --icons -R"
alias xt="exa --icons --tree --level=1"
alias ytdl="youtube-dl"
alias z="zathura"

# Suggestions and syntax highlighting
source ~/Code/Software/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Code/Software/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Binding some keys
# Use 'showkey -a' and 'bindkey | rg "\^M"'
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
bindkey '^[l'   forward-word
bindkey '^[u'   down-case-word
bindkey -s '^N' 'cd ..^Mexa --icons^M'
bindkey -r '^[f'

# PS1 - PS1
eval "$(starship init zsh)"
