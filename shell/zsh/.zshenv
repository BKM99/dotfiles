# TODO: make check for cargo/rust
if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

# . "$HOME/.cargo/env"

if command -v go &> /dev/null
then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
fi

if command -v nvim &> /dev/null
then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi
