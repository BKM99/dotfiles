# My dotfiles/configs
Take whatever you want from this, but use it at your own risk.

### Warnings
1. The install script will symlink the files that do not exist. If the file already exists in the specified location (look at install.conf.yaml) then the file/directory will be untouched. If you want the install script to overwrite your dotfiles with my dotfiles change "relink: true" to "force: true" in install.conf.yaml
2. Restart the terminal for changes to take effect.
3. These dotfiles are made for macOS

# How to install/setup:
```bash
git clone https://github.com/BKM99/.dotfiles.git ~/.dotfiles/
cd .dotfiles && ./install
```

# Contents
- Neovim config (LSP, DAP, telescope, cmp)
- ZSH config using [znap](https://github.com/marlonrichert/zsh-snap) as the plugin manager
- kitty terminal config
- git config
- random scripts to help automate certain things

# Things included but not currently updated/using
- alacritty terminal config
- tmux config
- bash config
