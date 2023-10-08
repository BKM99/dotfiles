#!/usr/bin/env python3

import os
import argparse
import shutil
from datetime import datetime


def create_symlinks(links, force, backup):
    script_dir = os.path.dirname(os.path.abspath(__file__))
    for source, dest in links.items():
        source = os.path.join(script_dir, source)
        dest = os.path.expanduser(dest)

        try:
            if os.path.exists(dest):
                if backup:
                    if os.path.islink(dest):
                        print("Skipping backup of symlink: {}".format(dest))
                        continue
                    backup_dir = create_backup_dir(backup)
                    backup_file = os.path.join(
                        backup_dir, os.path.basename(os.path.normpath(dest))
                    )
                    if not os.path.exists(backup_file):
                        shutil.move(dest, backup_file)
                        print(
                            "Backed up existing file: {} -> {}".format(
                                dest, backup_file
                            )
                        )
                    else:
                        print("Backup file already exists: {}".format(backup_file))
                elif force:
                    os.remove(dest)
                else:
                    print("Skipping {} as it already exists".format(dest))
                    continue
            os.symlink(source, dest)
            print("Created symlink: {} -> {}".format(source, dest))
        except OSError as e:
            print("Failed to create symlink: {} -> {}".format(source, dest))
            print("Error: {}".format(e))


def create_backup_dir(backup):
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    backup_dir = os.path.expanduser(os.path.join(backup, "backup_" + timestamp))
    os.makedirs(backup_dir, exist_ok=True)
    print("Created backup directory: {}".format(backup_dir))
    return backup_dir


def delete_symlinks(links):
    for dest in links.values():
        dest = os.path.expanduser(dest)
        try:
            os.remove(dest)
            print("Deleted symlink: {}".format(dest))
        except OSError as e:
            print("Failed to delete symlink: {}".format(dest))
            print("Error: {}".format(e))


def restore_backup(backup):
    if not os.path.exists(backup):
        print("Backup directory does not exist: {}".format(backup))
        return

    for root, dirs, files in os.walk(backup):
        for file in files:
            backup_file = os.path.join(root, file)
            dest_file = os.path.join(os.path.expanduser("~"), file)
            if not os.path.exists(dest_file):
                shutil.move(backup_file, dest_file)
                print(
                    "Restored file from backup: {} -> {}".format(backup_file, dest_file)
                )
            else:
                print("File already exists, skipping restore: {}".format(dest_file))


def main():
    parser = argparse.ArgumentParser(description="Create and Delete symlinks")
    parser.add_argument(
        "--force", action="store_true", help="Replace existing file if present"
    )
    parser.add_argument(
        "--cleanup",
        action="store_true",
        help="Delete existing symbolic links from the given files",
    )
    parser.add_argument(
        "--backup",
        metavar="DIR",
        help="Backup directory for existing files, must provide name for the backup dir",
    )
    parser.add_argument(
        "--restore", metavar="DIR", help="Restore files from the backup directory"
    )
    args = parser.parse_args()

    links = {
        # "./terminals/alacritty/alacritty.yml": "~/.config/alacritty",
        "./terminals/kitty": "~/.config/kitty",
        # "./terminals/wezterm/": "~/.config/wezterm",
        "./editor/nvim": "~/.config/nvim",
        "./editor/vimrc": "~/.vimrc",
        "./tools/gitconfig/.gitconfig": "~/.gitconfig",
        "./tools/gitconfig/.gitignore_global": "~/.gitignore_global",
        "./tools/tmux/.tmux.conf": "~/.tmux.conf",
        "./tools/conda/.condarc": "~/.condarc",
        "./tools/rtx": "~/.config/rtx",
        "./shell/zsh/.zshrc": "~/.zshrc",
        "./shell/zsh/.zsh-aliases": "~/.zsh-aliases",
        # "./shell/bash/.bashrc": "~/.bashrc",
        # "./shell/bash/.bash_profile": "~/.bash_profile",
        "./tools/karabiner": "~/.config/karabiner"
    }

    if args.cleanup:
        delete_symlinks(links)
    elif args.restore:
        restore_backup(args.restore)
    else:
        create_symlinks(links, args.force, args.backup)


if __name__ == "__main__":
    main()
