# Dan Bowling's Dotfiles

👋 Hi! This is a [Chezmoi](https://www.chezmoi.io) managed dotfiles repository for MacOS.

If you're looking for an alternative, I'd suggest [dotbot](https://github.com/anishathalye/dotbot) or [GNU Stow](https://www.gnu.org/software/stow/stow.html), or even [Dotbot Stow](https://github.com/timbedard/dotbot-stow/). Those are the ones I tried before moving to Chezmoi.

## Installing

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply dbowling
```

If everything works like it should, this will install Chezmoi, check out the repository, and begin the install process.

Prerequisits should already be installed on a Mac, the scripts will check for them before proceeding as well.

You will be prompted for information such as name and email (useful for home/work setups on different computers).

### Post-install

1. Copy over `id_rsa` from 1Password to the .ssh directory
1. Copy Kubernetes config

## Working Notes / TODO

Run brew --prefix to get the install location without making logic in the tempalte.
https://docs.brew.sh/Manpage#--prefix---unbrewed---installed-formula-

### Secrets

Anything involving a private key has been excluded from Chezmoi until I can hook up 1Password CLI.

Work secrets are stored in [1Password](https://1password.com/), and you'll need
the [1Password
CLI](https://support.1password.com/command-line-getting-started/) installed.

https://www.chezmoi.io/user-guide/password-managers/1password/

Login to 1Password for the first time with:

    eval $(op signin <subdomain>.1password.com <email>)

Then, to login afterwards, run:

    eval $(op signin)

{{-   onepasswordDocument "SSH public key" .vault -}}

{{- if .isovalent }}
{{    onepasswordDocument "SSH config" .vault -}}
{{- end }}

GPG
https://formulae.brew.sh/formula/pinentry-mac
https://github.com/twpayne/dotfiles/blob/master/home/private_dot_gnupg/gpg-agent.conf.tmpl
