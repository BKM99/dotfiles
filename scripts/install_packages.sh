which brew || echo brew not installed, now installing brew; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo installing packages...

brew install tmux
brew install bat 

echo Done!