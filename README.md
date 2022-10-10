# Brandon's dotfiles/configs

## How to install/setup:

These dotfiles were bootstrapped with [dotbot](https://github.com/anishathalye/dotbot).


Note: Git needs to be installed for the install script to work. If you want to use these files without running the install script you could just simply move/copy the files to their respective directories.

```bash
cd ~
git clone https://github.com/BKM99/.dotfiles.git
cd .dotfiles
./install
```

```bash
# load the zsh plugins using this command
plugin-load

# update zsh plugins using this command
plugin-update
```

## Warnings
1. The install script will **overwrite** the files specified in "install.conf.json", so please be careful. You should make backups for those files. Basically, "install" looks at "install.conf.json" and creates symlinks for the specified files. Go to the [dotbot](https://github.com/anishathalye/dotbot)  Github Repo to learn more.
2. Restart the terminal for changes to take effect.
3. When running nvim (Neovim) for the first time there may be some errors on the initial load. Run :checkhealth to make sure everything is working. Also, it might take a minute or so to install the plugins, treesitter parsers, LSPs, DAP, etc.
4. These dotfiles/configs are meant for me. So, there could be issues with some of the configurations.

## Features/Content

#### I use:
- OS: macOS and install most things with Homebrew
- Font: JetBrainsMono Nerd Font
- Colorscheme: [Tokyonight-night](https://github.com/folke/tokyonight.nvim#night)
- [kitty](https://github.com/kovidgoyal/kitty) (fast, GPU-based, true color, feature rich terminal)
- ZSH with [powerlevel10k](https://github.com/romkatv/powerlevel10k), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-completion](https://github.com/zsh-users/zsh-completions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [ZK](https://github.com/mickael-menu/zk), plain text Zettlekasten based note taking CLI app.
- [Neovim](https://github.com/neovim/neovim) (nvim)
    - LSP support
    - Debugging (DAP)
    - Autocomplete
    - Formatting/Linting
    - Snippets
    - Treesitter
    - Git integration
    - Telescope (fuzzy finder)
    - Markdown note taking support
    - View all the plugins I use in "editor/nvim/lua/config/plugins/packer.lua"

#### Other things I use:
- [autojump](https://github.com/wting/autojump)
- [btop](https://github.com/aristocratos/btop)
- [exa](https://github.com/ogham/exa)
- [fzf](https://github.com/junegunn/fzf)
- [ncdu](https://dev.yorhel.nl/ncdu)
- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virutalenv](https://github.com/pyenv/pyenv-virtualenv)
- [ranger](https://github.com/ranger/ranger)
- [tmux](https://github.com/tmux/tmux)
- view "scripts/install_packages.sh" to view the packages/programs I use
