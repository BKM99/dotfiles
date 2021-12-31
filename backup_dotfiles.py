from os import chdir, mkdir
from os.path import expanduser, exists, isfile
from time import time
from shutil import copy2, copytree

chdir(expanduser('~'))
files_to_copy = ['.config', '.condarc', '.bashrc','.bash_profile','.gitconfig','.gitignore_global',
                '.aliases','.hushlogin','.tmux.conf', '.tmux.conf.local', '.vimrc','.antigen.zsh','.p10k.zsh','.zshrc']

backup_name = "dotfile-backup-" + str(time())
mkdir(backup_name)

print('backing up dotfiles...')
for file in files_to_copy:
    if not exists(file):
        continue
    elif isfile(file):
        copy2(file, backup_name)
    else:
        copytree(file, backup_name + '/' + file)

print('dotfiles backed up to ~/' + backup_name)
