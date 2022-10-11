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

## Things I use

- Operating System: macOS
- Package Manager: Homebrew
- Font: JetBrainsMono Nerd Font
- Colorscheme: [Tokyonight-night](https://github.com/folke/tokyonight.nvim#night)
- Terminal: [kitty](https://github.com/kovidgoyal/kitty)
- Shell: ZSH with [powerlevel10k](https://github.com/romkatv/powerlevel10k), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-completion](https://github.com/zsh-users/zsh-completions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Editor: [Neovim](https://github.com/neovim/neovim)

Note: To see some other things I use not listed here go to "scripts/install_packages.sh", to see my neovim plugins go to "editor/nvim/lua/config/plugins/packer.lua"
