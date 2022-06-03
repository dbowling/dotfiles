#!/bin/sh

echo "[CHEZMOI] 🍺 Running maintenance on homebrew"

brew bundle -q
brew cleanup -q 2>&1