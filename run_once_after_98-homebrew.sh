#!/bin/sh

echo "🍺 Running maintenance on homebrew"

brew bundle -q
brew cleanup -q 2>&1