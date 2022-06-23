#!/bin/sh


echo "[CHEZMOI] 🍺 Running homebrew..."

brew bundle -q 2>&1

echo "[CHEZMOI] 🍺 Running maintenance on homebrew..."

brew update -q 2>&1
brew upgrade -q 2>&1
brew cleanup -q 2>&1
