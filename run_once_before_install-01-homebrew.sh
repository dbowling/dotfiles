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
brew "pyenv"
EOF

if [ -f "$HOME/.pyenv" ]; then
    PYTHON_VERSION=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    pyenv install $PYTHON_VERSION 
    pyenv global $PYTHON_VERSION
    pip install --upgrade pip
    pip install --user pipenv
    echo "[CHEZMOI] 🐍 Installed Python $PYTHON_VERSION with pyenv"
fi



if [ -f "$HOME/bin/chezmoi" ]; then
    echo "[CHEZMOI] 🍺 Delete chezmoi bin (which is now managed by homebrew)"
    rm "$HOME/bin/chezmoi"
fi