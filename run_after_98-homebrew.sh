#!/bin/sh

echo "🍺 Setapp"
[ -f $HOME/.env ] && 

echo "🍺 Running maintenance on homebrew"

brew bundle -q
brew cleanup -q 2>&1