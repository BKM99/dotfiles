# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh-aliases-general
source ~/.zsh-plugin-manager

HISTSIZE=10000
SAVEHIST=10000

ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}


zle_highlight=('paste:none')

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# completions
autoload -Uz compinit && compinit

zmodload zsh/complist

# compinit
_comp_options+=(globdots)
autoload -Uz colors && colors

plugins=(
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    romkatv/powerlevel10k
)

plugin-load $plugins

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v pyenv &> /dev/null
then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # this causes the shell to be extremely slow, not sure why
    # eval "$(pyenv virtualenv-init -)"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v zoxide &> /dev/null
then
    eval "$(zoxide init zsh)"
    alias j=z
fi

eval "$(fnm env --use-on-cd)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
