if ! command -v brew &> /dev/null
then
    echo "brew could not be found"
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing brew!"
fi

echo "installing packages..."

brew install tmux
brew install bat 
brew install git

echo "Done installing packages!"