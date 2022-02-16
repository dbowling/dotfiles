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