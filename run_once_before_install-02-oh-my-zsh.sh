#!/bin/sh

set -e # -e: exit on error

if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "Install Oh My ZSH!"
    /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi