#!/usr/bin/env fish

# 1. Fuzzel Selection
set -l selection (printf "ambxst\ncaelestia\ndms\nnoctalia\nwayle" | fuzzel --dmenu -p "Select Shell: " | string trim)
if test -z "$selection"
    exit 0
end

# 2. Update state
mkdir -p "$HOME/.config/hypr"
echo "$selection" >"$HOME/.config/hypr/.active_shell"

# 3. Call the Killer
fish "$HOME/.config/fish/functions/shell-kill.fish"

# 4. Call the Launcher
fish "$HOME/.config/fish/functions/shell-launch.fish"
