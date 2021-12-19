# My dotfiles/configurations
The install script will overwrite dotfiles/configuration files in the home directory. 

The python script "backup_dotfiles.py" copies affected files to a new folder in the home directory.

### How to install/setup:

```
cd $HOME
python3 backup_dotfiles.py
git clone https://github.com/BKM99/configs && cd configs && ./install
```

NOTE: restart terminal for changes to take effect
