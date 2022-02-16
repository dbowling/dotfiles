#!/bin/sh

set -e # -e: exit on error

echo "And now, Oh My ZSH!"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"