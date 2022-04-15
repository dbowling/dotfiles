#!/usr/bin/env zsh
# appends args to the restic backup command
# usage:
#   backup                      runs script as-is
#   backup --dry-run            additional arg of --dry-run
#   backup --dry-run --tag foo  multiple args are supported
backup() {
    export B2_ACCOUNT_ID="40cf006f2ecc"
    export B2_ACCOUNT_KEY="001bce3aa993ad23176be6928b8bd4a128317a53c2"
    export RESTIC_PASSWORD="macmouse"
    export RESTIC_REPOSITORY="b2:work-backups:restic"

    export B2_CONCURRENT_CONNECTIONS="10"

    echo "🚛 Backing up ~/code with Restic... "
    echo "🚛 ℹ️  conncurrent B2 connections: $B2_CONCURRENT_CONNECTIONS"
    echo "🚛 ℹ️  additional arguments: $* " 
    restic backup ~/code -o b2.connections=$B2_CONCURRENT_CONNECTIONS $* 
    echo "🚛 Snapshots... "
    restic snapshots --group-by host
}