#!/bin/sh

set -e # -e: exit on error

echo "And now, Oh My ZSH!"
[ ! -f $HOME/.oh-my-zsh/oh-my-zsh.sh ] && /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"