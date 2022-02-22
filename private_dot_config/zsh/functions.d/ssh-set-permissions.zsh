#!/usr/bin/env zsh


ssh-set-permissions() {
    if [[ -d "$HOME/.ssh" ]]; then
        chmod 755 "$HOME"/.ssh
        [[ -f "$HOME/.ssh/id_rsa" ]] && chmod 600 "$HOME"/.ssh/id_rsa
        [[ -f "$HOME/.ssh/id_rsa.pub" ]] && chmod 600 "$HOME"/.ssh/id_rsa.pub
    fi
}