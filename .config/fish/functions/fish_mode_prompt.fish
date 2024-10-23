# function fish_mode_prompt --description 'Displays the current mode'
# To reuse the mode indicator use this function instead
# fish_default_mode_prompt
# end
# function fish_mode_prompt --description 'Displays the current mode'
# end
# Commented out to use fish_mode_prompt instead
function fish_mode_prompt --description 'Write out the prompt'

    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_hide_untrackedfiles
        set -g __fish_git_prompt_hide_untrackedfiles 1
    end
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch magenta --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream informative
    end
    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate green --bold
    end

    set -l color_cwd
    set -l suffix
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else
            set color_cwd $fish_color_cwd
        end
        set suffix '#'
    else
        set color_cwd $fish_color_cwd
        set suffix '$'
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd --full-length-dirs=7 --dir-length=3)
    set_color normal

    printf '%s ' (fish_vcs_prompt)

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "] " "|" "$status_color" "$statusb_color" $last_pipestatus)
    echo -n $prompt_status
    set_color normal

    switch $fish_bind_mode
        case default
            set_color --bold green
            echo -n "Λ "
            # echo -n ">_ "
        case insert
            set_color --bold blue
            echo -n "λ "
            # echo -n ">_ "
        case replace_one
            set_color --bold purple
            echo -n "Λ "
            # echo -n ">_ "
        case replace
            set_color --bold purple
            echo -n "Λ "
            # echo -n ">_ "
        case visual
            set_color --bold yellow
            echo -n "Λ "
            # echo -n ">_ "
    end
    # echo -n "$suffix "
    set_color normal
end
