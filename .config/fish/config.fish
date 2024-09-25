# Aliases
abbr -a b bat
abbr -a btctl bluetoothctl
abbr -a c clear
abbr -a cg cargo
abbr -a cit git "--git-dir=$HOME/.dotfiles/" "--work-tree=$HOME"
abbr -a e hx
abbr -a gia git add
abbr -a gic git commit
abbr -a gicl git clone
abbr -a gid git diff
abbr -a gif git fetch
abbr -a gil git log
abbr -a gips git push
abbr -a gipl git pull
abbr -a gir git rm
abbr -a gis git status
abbr -a i ip -c
abbr -a icat kitty +kitten icat
abbr -a imv imv -b '\#282828'
abbr -a k kalker
abbr -a pmr doas pacman -Rns
abbr -a pms doas pacman -S
abbr -a x eza --icons
abbr -a xa eza --icons --tree --level=1 --all
abbr -a xal eza --icons --tree --level=1 --all --long
abbr -a xl eza --icons --tree --level=1 --long --git
abbr -a xr eza --icons -R
abbr -a xt eza --icons --tree --level=1
abbr -a za zathura
abbr -a zaf zathura --fork

# eza colors
set EXA_COLORS (vivid generate gruvbox-dark)

# Vi mode
set -g fish_key_bindings fish_vi_key_bindings

# zoxide
zoxide init fish | source
