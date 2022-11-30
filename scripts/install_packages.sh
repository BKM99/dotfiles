# download homebrew if it is not installed
if ! command -v brew &> /dev/null
then
    echo "homebrew could not be found. Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing homebrew!"
fi

echo "installing brew packages..."

brew install node
brew install tmux
brew install git
brew install git-delta
brew install nnn
brew install lazygit
brew install lazydocker
brew install neovim
brew install gnu-sed
brew install bat
brew install pyenv
brew install pyenv-virtualenv
brew install ncdu
brew install zk
brew install tldr
brew install autojump
brew install exa
brew install go
brew install gradle
brew install yarn
brew install tree
brew install broot
brew install ripgrep
brew install fzf
# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install
brew install fd
brew install hyperfine
brew install btop
brew install rustup
rustup-init -y

brew install --cask docker
brew install --cask amethyst
brew install --cask kitty
brew install --cask zoom
brew install --cask spotify
brew install --cask discord
brew install --cask obsidian
brew install --cask the-unarchiver
brew install --cask google-chrome

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

echo "done installing brew packages"

echo "installing sdkman..."
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "installed everything"
