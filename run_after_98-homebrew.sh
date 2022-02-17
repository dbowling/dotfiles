#!/bin/sh

echo "🍺 Running maintenance on homebrew..."

brew bundle
brew update
brew upgrade
brew cleanup
brew doctor 2>&1