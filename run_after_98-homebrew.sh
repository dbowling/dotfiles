#!/bin/sh

echo "🍺 Running maintenance on homebrew..."

brew update
brew upgrade
brew cleanup
brew doctor

echo "🍺 Done! You can do this with the alias brewup now."