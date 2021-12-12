# download homebrew if it is not installed
if ! command -v brew &> /dev/null
then
    echo "brew could not be found"
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing brew!"
fi

echo "installing packages..."

brew install tmux
brew install git
brew install neovim
brew install iterm2

echo "Done installing packages!"
