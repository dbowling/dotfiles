#!/usr/bin/env zsh

vivid-themes() {
for theme in $(vivid themes); do
    echo "Theme: $theme"
    LS_COLORS=$(vivid generate $theme)
    ls -lah
    echo
done
}
