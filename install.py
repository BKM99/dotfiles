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

        if os.path.islink(dest):
            print("Skipping backup of symlink: {}".format(dest))
            continue

        try:
            if os.path.exists(dest):
                if backup:
                    backup_dir = create_backup_dir(backup)
                    backup_file = os.path.join(backup_dir, os.path.basename(dest))
                    if os.path.exists(backup_file):
                        print(
                            "Restoring original file: {} -> {}".format(
                                backup_file, dest
                            )
                        )
                        shutil.move(backup_file, dest)
                    else:
                        print(
                            "Original file not found in the backup directory: {}".format(
                                backup_file
                            )
                        )
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
    backup_dir = os.path.join(backup, "backup_" + timestamp)
    if os.path.exists(backup_dir):
        print("Using existing backup directory: {}".format(backup_dir))
    else:
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
        metavar="<directory_name>",
        help="Backup directory for existing files, must provide name for the backup dir",
    )
    args = parser.parse_args()

    links = {
        "./terminals/kitty": "~/.config/kitty",
        "./terminals/alacritty/alacritty.yml": "~/.config/alacritty",
        "./editor/nvim": "~/.config/nvim",
        "./editor/vimrc": "~/.vimrc",
        "./tools/git/.gitconfig": "~/.gitconfig",
        "./tools/git/.gitignore_global": "~/.gitignore_global",
        "./tools/tmux/.tmux.conf": "~/.tmux.conf",
        "./tools/conda/.condarc": "~/.condarc",
        "./shell/zsh/.zshrc": "~/.zshrc",
        "./shell/zsh/.zshenv": "~/.zshenv",
        "./shell/zsh/.zsh-aliases": "~/.zsh-aliases",
        "./shell/bash/.bashrc": "~/.bashrc",
        "./shell/bash/.bash_profile": "~/.bash_profile",
    }

    if args.cleanup:
        delete_symlinks(links)
    else:
        create_symlinks(links, args.force, args.backup)


if __name__ == "__main__":
    main()
