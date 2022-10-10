export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/bin/zk
export ZK_NOTEBOOK_DIR="$HOME/Documents/Notes/"
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
. "$HOME/.cargo/env"

if (( $+commands[nvim] )); then
    export EDITOR='nvim'
    export VISUAL='nvim'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

