# Aliases
abbr -a at astroterm -cu -f 60 -m -i copenhagen
abbr -a b bat
abbr -a btctl bluetoothctl
abbr -a c clear \;
abbr -a cg cargo
abbr -a config git --git-dir=/home/notroot/.cfg/ --work-tree=/home/notroot
abbr -a dust dust -r
abbr -a dym dym -v
abbr -a e hx
abbr -a gia git add
abbr -a gic git commit
abbr -a gicl git clone
abbr -a gid git diff
abbr -a gif git fetch
abbr -a gil git log --graph
abbr -a gips git push
abbr -a gipl git pull
abbr -a gir git rm
abbr -a gis git status
abbr -a i ips
abbr -a imv imv -b '\#282828'
abbr -a kb head -n 42 ~/Documents/keymap.c
abbr -a objdump objdump -M intel
abbr -a rman rusty-man
abbr -a showcolor perl -e '\'print "\e[48;2;".join(";",unpack("C*",pack("H*",$ARGV[0])))."m  \e[49m"\''
abbr -a wi wiki-tui
abbr -a x eza
abbr -a xa eza -aoTlgL1 --git
abbr -a xl eza -oTlgL1 --git
abbr -a yt yt-dlp -o \'%\(title\)s.%\(ext\)s\'
abbr -a za zathura
abbr -a zaf zathura --fork

# eza colors
set EXA_COLORS (vivid generate gruvbox-dark)
set LS_COLORS $EXA_COLORS

# Vi mode
set -g fish_key_bindings fish_vi_key_bindings

# zoxide
zoxide init fish | source
