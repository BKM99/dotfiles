PROMPT='%n: %F{blue}%3~ %(?.%F{green}.%F{red})%#%f '

# Enable Vi mode
bindkey -v

zle_highlight=('paste:none')

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)
autoload -Uz colors && colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh-aliases
