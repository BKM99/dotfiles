# download homebrew if it is not installed
if ! command -v brew &> /dev/null
then
    echo "homebrew could not be found"
    echo "installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing brew!"
fi

echo "installing brew packages..."

brew install nvm
brew install tmux
brew install git
brew install neovim
brew install autojump
brew install exa
brew install go
brew install gradle
brew install yarn
brew install ripgrep
brew install docker
brew install --cask zoom
brew install --cask alacritty
brew install --cask spotify
brew install --cask discord
brew install --cask the-unarchiver
brew install --cask google-chrome
brew install --cask intellij-idea-ce
brew install --cask visual-studio-code
brew install --cask miniconda
conda init "$(basename "${SHELL}")"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "done installing brew packages"

echo "installing rust..."
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "installing sdkman..."
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "installed everything"
