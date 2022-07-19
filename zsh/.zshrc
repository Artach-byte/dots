################################################################################
#                           History config                                     #
################################################################################

export HISTFILE=~/.config/zsh/zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTORY_IGNORE="(ls|clear|smi|mi3|cd3|zz|cds|cdc|idrive|ch|cd|pwd|smi|cdx|msx|mdx|cc|xx|exit|cat|msx|cdw|cdi|..|history|cd -|cd ..)"

setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY          # Share history between all sessions.

################################################################################
#                             Misc config                                      #
################################################################################

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_NAME_DIRS       # Any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt GLOB_DOTS            # Do not require a leading ‘.’ in a filename to be matched explicitly.
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells
setopt MAGIC_EQUAL_SUBST    # All unquoted arguments of the form ‘anything=expression’ appearing after the command name have filename expansion
setopt NOTIFY               # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt PROMPT_SUBST         # If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# diable vi mode
bindkey -e

# completion
autoload -Uz compinit
compinit

# Nord theme for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#323844,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#323844,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# # Dracula Theme for fzf
# export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

## Alias config
source ~/.config/zsh/aliases.zsh

setopt autocd extendedglob nomatch notify

################################################################################
#                                 Plugins Start                                #
################################################################################

## MUST BE FIRST PLUGIN: fzf tab plugin -> https://github.com/Aloxaf/fzf-tab
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

## zsh-autosuggestions -> https://github.com/zsh-users/zsh-autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

## zsh-autopair -> https://github.com/hlissner/zsh-autopair
source ~/.config/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh

## zsh-fzf-history-search -> https://github.com/joshskidmore/zsh-fzf-history-search
source ~/.config/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh

## zsh-z -> https://github.com/agkozak/zsh-z
source ~/.config/zsh/plugins/zsh-z/zsh-z.plugin.zsh

## colored-man-pages -> https://github.com/ael-code/zsh-colored-man-pages
source ~/.config/zsh/plugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh

## completion for gh-cli -> https://github.com/sudosubin/zsh-github-cli
source ~/.config/zsh/plugins/zsh-github-cli/cli.plugin.zsh

## zsh-exa -> https://github.com/TwoPizza9621536/zsh-exa
source ~/.config/zsh/plugins/zsh-exa/zsh-exa.plugin.zsh

## MUST BE LAST PLUGIN: syntax highlighting -> https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

################################################################################
#                              Plugins End                                     #
################################################################################

# starship Prompt
eval "$(starship init zsh)"
