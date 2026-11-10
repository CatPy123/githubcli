#!/usr/bin/env bash

winget install --id GitHub.cli --scope user --accept-package-agreements --accept-source-agreements

clipath=$(find "$HOME" -name "gh.exe" 2>/dev/null | head -n 1 | tr -d '\r')

echo "$clipath"

if [ -n "$clipath" ]; then
    echo "alias gh='$clipath'" > ~/.bashrc
fi

shopt -s expand_aliases

if [ -f ~/.bashrc ]; then
    eval "$(grep -E '^alias gh=' ~/.bashrc | tr -d '\r')"
fi

echo "Y" | gh auth login --hostname github.com --git-protocol https --web

