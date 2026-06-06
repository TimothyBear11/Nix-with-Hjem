#!/usr/bin/env fish
# ~/.config/hypr/scripts/shell-switcher.fish

# 1. Force the selection into a variable, strip whitespace
set -l selection (printf "ambxst\ncaelestia\ndms\nnoctalia\nnoctaliav5\nwayle" | fuzzel --dmenu -p "Select Shell: " | string trim)

# If they hit ESC, just exit
if test -z "$selection"
    exit 0
end

# 2. Kill the previous shell session variants
# We use pkill -f to catch any backgrounded python/lua/qml wrappers
pkill -9 -f noctalia
pkill -9 -f wayle
pkill -9 -f ambxst
pkill -9 -f dms
pkill -9 -f caelestia

# 3. Write the selection to the state file
echo "$selection" >/home/tbear/.config/hypr/.active_shell

# 4. Trigger the reload (absolute path)
/run/current-system/sw/bin/hyprctl reload
