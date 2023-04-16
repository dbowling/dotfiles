# Dan Bowling's Dotfiles

👋 Hi! This is a [Chezmoi](https://www.chezmoi.io) managed dotfiles repository for MacOS. I found other people's setups really useful, so I'm sharing mine--warts and all!

You will find:

- Zplug for ZSH management
- Spaceship prompt for terminal theme
- Most integrations work with Kitty terminal, so I leave Terminal and iTerm2 mostly untouched as a fallback

I've found it useful to also use this repository to automatically install all the software I can figure out how to automate.

## Alternatives to Chezmoi

If you're looking for a dotfile-specific alternative to Chezmoi, I'd suggest [Dotbot](https://github.com/anishathalye/dotbot) or [GNU Stow](https://www.gnu.org/software/stow/stow.html), or even [Dotbot Stow](https://github.com/timbedard/dotbot-stow/). For a more robust manager, take a look at Ansible.

## First Install

Installation is a one line command for all managed software and dotfiles.

### Prerequisites

None. Even Homebrew is installed for you if not present.

### Install

Chezmoi has a curlbash to install a github dotfiles repo:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply dbowling
```

If everything works like it should, this will install Chezmoi, check out the repository, and begin the install process for the dotfiles and managed software.

You will be prompted for information such as name and email (useful for home/work setups on different computers). Chezmoi stores this in their local BoltDB database.

### Post-install

This repository introduces the pattern of using ZSH to check for any manual actions that haven't been performed. If a check fails, it will output a message prefixed with `[CHEZMOI]` for easy troubleshooting.

The pattern is as follows:

```bash
# .zenv
POSTGRES_BIN_DIR="/Applications/Postgres.app/Contents/Versions/latest/bin"
if [ -d "$POSTGRES_BIN_DIR" ]; then
  export PATH=${POSTGRES_BIN_DIR}:$PATH
else
  unset POSTGRES_BIN_DIR
fi

# post install script
if [ -z "${POSTGRES_BIN_DIR+1}" ]; then
  echo "[CHEZMOI] Postgres is expected.\n"
  echo "          Install from https://postgresapp.com"
fi
```

## Ongoing Use

### Quick Run

`ca` is a defined alias to `chezmoi apply`.

### Homebrew Maintenance

The first item to run after Chezmoi is always a maintenance script for homebrew unless it is explicitly skipped.

TODO - Check for environment variable

## Development

### Makefile vs. Curlbash

The Makefile is for development, and does not do the initial install. The `install` target is actually an alias to `chezmoi apply`. Use the above curlbash for the initial install.

### ZSH Functions

A goal of mine is to collect useful tips and place those under `~.config/zsh/functions.d/` so they show up in autocomplete. To simplify that end, `helpers.zsh` includes `test-func()`. This allows skipping the apply step to test most functions.

### TODO

Allow acknowledgement of each check in a persistant way to skip installation and warnings.

Use `brew --prefix` to get the install location without making logic in the tempalte.
See [prefix docs](https://docs.brew.sh/Manpage#--prefix---unbrewed---installed-formula-).

### Secret Management

**1Password 8** now includes SSH key management, so the following is no longer used for SSH keys. I'll leave it in this readme for a while as a note on how to retrieve old keys that haven't been regenerated yet.

Work secrets are stored in [1Password](https://1password.com/), and you'll need
the [1Password
CLI](https://support.1password.com/command-line-getting-started/) installed.

https://www.chezmoi.io/user-guide/password-managers/1password/

Login to 1Password for the first time with:

    eval $(op signin <subdomain>.1password.com <email>)

    eval $(op signin my.1password.com dan@northlander.org)

Then, to login afterwards, run:

    eval $(op signin)

op list items --categories Identity | jq

{{-   onepasswordDocument "SSH public key" .vault -}}

{{- if .isovalent }}
{{    onepasswordDocument "SSH config" .vault -}}
{{- end }}

GPG
https://formulae.brew.sh/formula/pinentry-mac
https://github.com/twpayne/dotfiles/blob/master/home/private_dot_gnupg/gpg-agent.conf.tmpl
