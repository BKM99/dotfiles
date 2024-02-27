# How to setup
```bash
git clone https://github.com/BKM99/dotfiles.git ~/dotfiles/
cd ~/dotfiles/
stow -v */  # or stow -v <package>
```
Note: Brewfile contains a list of packages/apps that I use on macOS

Recommendations:
- Use a terminal that supports true color ([Alacritty](https://alacritty.org/), [Kitty](https://sw.kovidgoyal.net/kitty/), [iTerm2](https://iterm2.com/), [WezTerm](https://wezfurlong.org/wezterm/index.html), ...) colors will look off without true color support
- Install a [nerd font](https://www.nerdfonts.com/)
- For neovim:
    - Install [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd), and [fzf](https://github.com/junegunn/fzf). Some plugins/options use them.
- I use [powerlevel10k](https://github.com/romkatv/powerlevel10k) as my ZSH prompt
