#!/usr/bin/env fish
# ~/nix/configs/fish/functions/shell-switch-simple.fish

# 1. Selection
set -l selection (printf "ambxst\ncaelestia\ndms\nnoctalia\nnoctaliav5\nwayle" | fuzzel --dmenu -p "Select Shell: " | string trim)
if test -z "$selection"
    exit 0
end

# 2. Kill Logic
# Quickshell-based shells (ambxst, caelestia, dms, noctalia)
pkill -9 -x quickshell 2>/dev/null
# Standalone shells
pkill -9 -x wayle 2>/dev/null
pkill -9 -x noctaliav5 2>/dev/null # Or your specific binary name for v5

# 3. Launch Logic
switch $selection
    case ambxst
        ambxst &
        disown
    case caelestia
        caelestia-shell -d &
        disown
    case dms
        dms run &
        disown
    case noctalia
        noctalia-shell &
        disown
    case noctaliav5
        noctalia &
        disown
    case wayle
        wayle shell &
        disown
        sleep 0.5
        wayle panel start &
        disown
end

# 4. Final Clean Exit
exec >/dev/null 2>&1
exit 0
