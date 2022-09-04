# Brandon's dotfiles/configs

## How to install/setup:

These dotfiles were bootstrapped with [dotbot](https://github.com/anishathalye/dotbot).


Note: Git needs to be installed for the install script to work. If you want to use these files without running the install script you could just simply move/copy the files to their respective directories.

```bash
cd $HOME
git clone https://github.com/BKM99/configs
cd configs
./install
```

## Warnings
1. The install script will **overwrite** the files specified in "install.conf.json", so please be careful. You should make backups for those files. Maybe in the future I'll make a script to backup those files.
2. Restart the terminal for changes to take effect.
3. When running nvim (Neovim) for the first time there may be some errors on the initial load. Run :checkhealth to make sure everything is working.
