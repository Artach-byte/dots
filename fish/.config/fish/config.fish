if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR nvim
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
