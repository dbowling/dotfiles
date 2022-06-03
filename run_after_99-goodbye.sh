#!/bin/sh

source ~/.zenv

if [ -z "${POSTGRES_BIN_DIR+1}" ]; then
  echo "[CHEZMOI]  Postgres is expected.\n"
  echo "           Install from https://postgresapp.com"
fi

echo "Don't forget edit files in the repo. Run 'chezmoi cd' to get there." | cowsay | lolcat