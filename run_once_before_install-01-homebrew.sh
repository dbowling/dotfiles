#!/bin/sh

set -e # -e: exit on error

if [ ! "$(command -v brew)" ]; then
    echo "Let's install Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Now, some homebrew essentials..." 

brew bundle --file=/dev/stdin <<EOF
tap "homebrew/core"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "buo/cask-upgrade"
brew "chezmoi"
brew "mas"
brew "zsh"
brew "git"
brew "zplug"
brew "vivid"
brew "nvm"
brew "pinentry-mac"
brew "gpg"
EOF

echo "Delete chezmoi bin, which is now managed by homebrew"
rm "$HOME/bin/chezmoi"