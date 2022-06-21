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
    alias x='xplr'
    # exa
    alias exa='exa --long --header --git --all'
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

