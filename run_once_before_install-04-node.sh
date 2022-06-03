#!/bin/sh

set -e # -e: exit on error

echo "[CHEZMOI] 🍺 Install Volta managed NodeJS" 

brew bundle -q --file=/dev/stdin <<EOF
brew "volta"
EOF

volta install node