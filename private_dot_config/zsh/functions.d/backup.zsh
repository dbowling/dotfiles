#!/usr/bin/env zsh
# appends args to the restic backup command
# usage:
#   backup                      runs script as-is
#   backup --dry-run            additional arg of --dry-run
#   backup --dry-run --tag foo  multiple args are supported
backup() {
    export B2_CONCURRENT_CONNECTIONS="10"

    echo "🚛 You will need to specify restic env variables:"
    echo "🚛     B2_ACCOUNT_ID:     $B2_ACCOUNT_ID"
    echo "🚛     B2_ACCOUNT_KEY:    $B2_ACCOUNT_KEY"
    echo "🚛     RESTIC_REPOSITORY: $RESTIC_REPOSITORY"
    echo "🚛 Backing up ~/code with Restic... "
    echo "🚛 ℹ️  conncurrent B2 connections: $B2_CONCURRENT_CONNECTIONS"
    echo "🚛 ℹ️  additional arguments: $* " 
    restic backup ~/code -o b2.connections=$B2_CONCURRENT_CONNECTIONS --exclude="node_modules" $* 
    echo "🚛 Snapshots... "
    restic snapshots --group-by host
}