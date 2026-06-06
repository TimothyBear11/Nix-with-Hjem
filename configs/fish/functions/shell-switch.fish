#!/usr/bin/env fish

set -l selection (printf "ambxst\ncaelestia\ndms\nnoctalia\nwayle" | fuzzel --dmenu -p "Select Shell: ")
if test -z "$selection"
    exit 0
end

# 1. Kill the current shell explicitly BEFORE writing the file
pkill -9 -x noctalia-shell
pkill -9 -x wayle
# ... (add other shell names here as needed)

# 2. Update the state file
echo "$selection" >~/.config/hypr/.active_shell

# 3. Trigger reload
hyprctl reload
