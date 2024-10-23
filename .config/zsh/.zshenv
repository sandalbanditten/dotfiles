# for reading man pages with nvim
export PATH="$PATH:$HOME/.config/nvim/plugged/vim-superman/bin"
export VISUAL="vi"
export XDG_CONFIG_HOME="$HOME/.config"
# other path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Code/scripts"
# for gpg
export GPG_TTY="$(tty)"
# programs
export FZF_DEFAULT_OPTS="--color fg:#EBDBB2,hl:#504945,fg+:#EBDBB2,bg+:#3C3836,hl+:#504945,pointer:#FB4934,info:#928374,spinner:#928374,header:#928374,prompt:#458588,marker:#D79921"
export EDITOR="helix"
export TERM="xterm-kitty"
export TERM_PROGRAM="xterm-kitty"
export TERMINAL="xterm-kitty"
export BAT_THEME="base16"
export PASTEL_COLOR_MODE="24bit"
# kinda cursed, see exa_colors(5)
export EXA_COLORS="*.docx=37;1:*.png=33:*.svg=33:*.jpg=33:*.jpeg=33:*.wav=33:*.gif=33:*.mp3=33:*.mkv=33:*.ogg=33:*.mp4=33:*.webm=33:*.o=32;4:*.odt=37;1:*.tex=37;1:*.pdf=37;1:*.zip=38;5;5:*.gz=38;5;5:*.7z=38;5;5:*.iso=4;32:*.hi=38;5;5"
export XCURSOR_SIZE=16
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export WORDCHARS="$WORDCHARS:\"\'|"
# Will remove / from the wordchars
export WORDCHARS="${WORDCHARS//\/}"
export TEXMFHOME="/home/notroot/.texmf"
. "$HOME/.cargo/env"
