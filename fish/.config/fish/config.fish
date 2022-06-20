if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR nvim
    set --universal pure_color_system_time pure_color_mute
    set -g async_prompt_functions _pure_prompt_git
  # Aliases for LSD
    alias ls='lsd'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'
    # lazygit
    alias lg='lazygit'
    # back directory
    alias ..='cd ..'
    # file Managers
    # alias r='ranger'
    alias x='xplr'


end
