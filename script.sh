#!/usr/bin/env bash

winget install --id GitHub.cli --scope user --accept-package-agreements --accept-source-agreements

clipath=$(find "$(cygpath -u "$LOCALAPPDATA")/Programs" "$(cygpath -u "$LOCALAPPDATA")/Microsoft/WinGet" "$(cygpath -u "$LOCALAPPDATA")/Microsoft/WindowsApps" -name "gh.exe" 2>/dev/null | head -n 1 | tr -d '\r')

if [ -n "$clipath" ]; then
    [[ "$clipath" != /* ]] && clipath="/$clipath"
    
    grep -v '^alias gh=' ~/.bashrc > ~/.bashrc.tmp 2>/dev/null || true
    mv ~/.bashrc.tmp ~/.bashrc
    echo "alias gh=\"$clipath\"" >> ~/.bashrc
fi

echo "Y" | "$clipath" auth login --hostname github.com --git-protocol https --web
