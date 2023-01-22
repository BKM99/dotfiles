#!/usr/bin/env bash

# List out all installed apps along with all the apps each app is dependent on.

brew list -1 --formula | while read -r cask; do
    echo -ne "\x1B[1;34m $cask \x1B[0m"
    brew uses "$cask" --installed | awk '{printf(" %s ", $0)}'
    echo ""
done
