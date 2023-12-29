# Nushell Environment Config File
#
# version = 0.79.0

def create_left_prompt [] {
    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        # ($env.PWD | str substring 0..($home | str length) | str replace -s $home "~"),
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi lgb)
        ("[")
        (ansi rb)
        ($env.LAST_EXIT_CODE)
        (ansi lgb)
        ("] ")
    ] | str join)
    } else { "" }

    let path_segment = if (is-admin) {
        $"($last_exit_code)(ansi red_bold)($dir) "
    } else {
        $"($last_exit_code)(ansi green_bold)($dir) "
    }

    $path_segment
}

def create_right_prompt [] {
    ""
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
# These can be closures
$env.PROMPT_INDICATOR = "λ "
$env.PROMPT_INDICATOR_VI_INSERT = "λ "
$env.PROMPT_INDICATOR_VI_NORMAL = "Λ "
$env.PROMPT_MULTILINE_INDICATOR = ":λ: "

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Personal additions
$env.CARGO_MOMMYS_LITTLE = "boy"
$env.VISUAL = "vi"
$env.GPG_TTY = $"(tty)"
# programs
$env.FZF_DEFAULT_OPTS = "--color fg:#EBDBB2,hl:#504945,fg+:#EBDBB2,bg+:#3C3836,hl+:#504945,pointer:#FB4934,info:#928374,spinner:#928374,header:#928374,prompt:#458588,marker:#D79921"
$env.EDITOR = "helix"
$env.BAT_THEME = "base16"
$env.PASTEL_COLOR_MODE = "24bit"
# kinda cursed, see exa_colors(5)
# $env.EXA_COLORS = "*.docx=37;1:*.png=33:*.svg=33:*.jpg=33:*.jpeg=33:*.wav=33:*.gif=33:*.mp3=33:*.mkv=33:*.opus=33:*.ogg=33:*.mp4=33:*.webm=33:*.o=32;4:*.odt=37;1:*.tex=37;1:*.pdf=37;1:*.zip=38;5;5:*.gz=38;5;5:*.7z=38;5;5:*.iso=4;32:*.hi=38;5;5"
# now using vivid to generate themes
$env.EXA_COLORS = $"(vivid generate gruvbox-dark)"
$env.LS_COLORS = $"($env.EXA_COLORS)"
$env.RUSTC_WRAPPER = "sccache"
$env.XCURSOR_SIZE = 16
$env.STARSHIP_CONFIG = "~/.config/starship/starship.toml"
$env.TEXMFHOME = "/home/notroot/.texmf"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
