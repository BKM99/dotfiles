# download homebrew if it is not installed
if ! command -v brew &> /dev/null
then
    echo "homebrew could not be found"
    echo "installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing brew!"
fi

echo "installing homebrew packages..."

brew install node
brew install tmux
brew install git
brew install neovim
brew install --cask alacritty
brew install peco
brew install jenv

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font 

echo "Done installing packages!"
