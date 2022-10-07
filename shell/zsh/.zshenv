export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/bin/zk
export ZK_NOTEBOOK_DIR="$HOME/Documents/Notes/"

if (( $+commands[nvim] )); then
    export EDITOR='nvim'
    export VISUAL='nvim'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

# rust (cargo)
if [ -d $HOME/.cargo/bin/ ]; then
    path=( $path $HOME/.cargo/bin )
fi
