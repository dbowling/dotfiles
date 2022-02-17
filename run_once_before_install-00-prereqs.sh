#!/bin/sh

set -e # -e: exit on error

if [ ! "$(command -v curl)" ]; then
    echo "⚠️ To install, you must have curl." >&2
    exit 1
fi

if [ ! "$(command -v ruby)" ]; then
    echo "⚠️ To install, you must have ruby." >&2
    exit 1
fi

if [ ! "$(command -v chezmoi)" ]; then
    # this is the default location, which might not be in the path
    [ -f $HOME/bin/chezmoi ] && export PATH="$HOME/bin:$PATH"
fi

# Check for chezmoi again after fix
if [ ! "$(command -v chezmoi)" ]; then
    echo "⚠️ chezmoi cannot be found" >&2
    exit 1
fi

echo "👍 Initial checks look good!"