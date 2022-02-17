#!/bin/sh

set -e # -e: exit on error

if [ ! "$(command -v brew)" ]; then
    echo "Let's install Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Now, some homebrew essentials..." 

brew bundle --file=/dev/stdin <<EOF
brew "chezmoi"
brew "zsh"
brew "git"
brew "zplug"
brew "vivid"
brew "nvm"
brew "pinentry-mac"
brew "gpg"
EOF