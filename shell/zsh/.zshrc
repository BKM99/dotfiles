export SHELL=/bin/zsh
export XDG_CONFIG_HOME=$HOME/.config/

PROMPT='%n: %F{blue}%3~ %(?.%F{green}.%F{red})%#%f '

eval $(/opt/homebrew/bin/brew shellenv)
eval "$(/opt/homebrew/bin/rtx activate zsh)"
eval "$(direnv hook zsh)"

source ~/.zsh-aliases

export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE

zle_highlight=('paste:none')

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)
autoload -Uz colors && colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d /usr/local/go/bin/ ]; then
    export GOPATH=~/go
    export GOBIN="$GOPATH/bin"
    export PATH="/usr/local/go/bin:$GOBIN:$PATH"
elif [ -d ~/.go/bin/ ]; then
    export GOPATH=$HOME/.go
    export GOROOT="$HOME/.go"
    export GOBIN=$GOPATH/bin
    export PATH="$GOPATH/bin:$PATH"
    # export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

if [[ -d "$HOME/.dotnet/" ]]; then
    export PATH="$HOME/.dotnet/:$PATH"
fi
# export PATH="$PATH:$HOME/.dotnet/tools"

# Check if nvim is installed
if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
