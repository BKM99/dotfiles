# .zshenv is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# .zshenv' should not contain commands that produce output or assume the shell is attached to a tty.

# export PATH="/usr/local/sbin:$PATH"
# TODO: make check for cargo/rust
. "$HOME/.cargo/env"

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

# this is to install the norg treesitter parser
# export CC="/usr/local/bin/gcc-12"
