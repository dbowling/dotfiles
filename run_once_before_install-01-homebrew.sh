#!/bin/sh

set -e # -e: exit on error

if [ ! "$(command -v brew)" ]; then
    echo "[CHEZMOI] 🍺 Install Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "[CHEZMOI] 🍺 Install setup essentials (Brewfile will be installed later)" 

brew bundle -q --file=/dev/stdin <<EOF
tap "homebrew/core"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "buo/cask-upgrade"
brew "chezmoi"
brew "mas"
brew "z"
brew "zsh"
brew "zplug"
brew "zsh-completions"
brew "git"
brew "vivid"
brew "pinentry-mac"
brew "ripgrep"
brew "gpg"
brew "gawk"
EOF

if [ -f "$HOME/bin/chezmoi" ]; then
    echo "[CHEZMOI] 🍺 Delete chezmoi bin (which is now managed by homebrew)"
    rm "$HOME/bin/chezmoi"
fi