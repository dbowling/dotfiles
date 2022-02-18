#!/usr/bin/env zsh

#
#    sshcreate <name>
#
# Create a new ssh key at ~/.ssh/<name> with permission 700. The name will be put as comment in the key as well.

ssh-create() {
    if [ ! -z "$1" ]; then
        ssh-keygen -f $HOME/.ssh/$1 -t rsa -N '' -C "$1"
        chmod 700 $HOME/.ssh/$1*
    fi
}