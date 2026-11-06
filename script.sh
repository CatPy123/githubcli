#!/usr/bin/env bash

winget install --id GitHub.cli --scope user

clipath=$(find /c/Users/$USER -name "gh.exe" 2>/dev/null)

echo $clipath

echo alias gh="$clipath" > ~/.bashrc

source ~/.bashrc

echo "Y" | gh auth login --hostname github.com --git-protocol https --web

