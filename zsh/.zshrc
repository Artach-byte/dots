# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History config
export HISTFILE=~/.config/zsh/zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTORY_IGNORE="(ls|smi|mi3|cd3|zz|cds|cdc|idrive|ch|cd|pwd|smi|cdx|msx|mdx|cc|xx|exit|cat|msx|cdw|cdi|..|history|cd -|cd ..)"

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# diable vi mode
bindkey -e

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

# Nord theme for fzf in wezterm
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#323844,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#323844,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

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

## theme for zsh -> https://github.com/romkatv/powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

## Alias config
source ~/.config/zsh/aliases.zsh

## MUST BE LAST PLUGIN: syntax highlighting -> https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

################################################################################
#                              Plugins End                                     #
################################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
