# My dotfiles/configs
Take whatever you want from this, but use it at your own risk.

# How to install/setup:
```bash
git clone https://github.com/BKM99/.dotfiles.git ~/.dotfiles/
cd .dotfiles/
chmod +x install.py
./install.py
```

# How to use the install script:
Run "./install.py --help" to view additional options

--force will replace/overwrite your files with my dotfiles

--backup <dir_name> will backup your dotfiles if they conflict and exist with my dotfiles

--cleanup will remove all symlinks created by this script

Tip: comment out the paths in the links dictionary (line 103 - 117) to not use certain files
