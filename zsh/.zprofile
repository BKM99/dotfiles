export SHELL=/bin/zsh
export XDG_CONFIG_HOME=$HOME/.config/
export PATH="$HOME/.local/scripts/:$PATH"
export MANPAGER='less -X';

if [[ -f /opt/homebrew/bin/brew ]]; then
    # Homebrew exists at /opt/homebrew for arm64 macOS
    HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -f /usr/local/bin/brew ]]; then
    # Homebrew exists at /usr/local for Intel macOS
    HOMEBREW_PREFIX="/usr/local"
fi

if [[ -n "$HOMEBREW_PREFIX" ]]; then
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
	eval "$($HOMEBREW_PREFIX/bin/mise activate zsh)"
	source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
fi

if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi
