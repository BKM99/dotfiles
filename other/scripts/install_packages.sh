# download homebrew if it is not installed
if ! command -v brew &> /dev/null
then
    echo "homebrew could not be found"
    echo "installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "done installing brew!"
fi

echo "installing apps packages..."

brew install node
brew install tmux
brew install git
brew install neovim
brew install peco
brew install openjdk@8
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
brew install jenv
brew install mysql
brew install --cask zoom
brew install --cask alacritty
brew install --cask spotify
brew install --cask discord
brew install --cask slack
brew install --cask the-unarchiver
brew install --cask google-chrome
brew install --cask intellij-idea-ce
brew install --cask visual-studio-code
brew install --cask miniconda
conda init "$(basename "${SHELL}")"
brew install --cask rstudio
brew install r

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font 

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

echo "done installing apps!"