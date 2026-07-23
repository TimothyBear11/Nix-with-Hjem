#!/usr/bin/env fish
# The Launcher: Pure creation.

set -l active_file "$HOME/.config/hypr/.active_shell"

if not test -f "$active_file"
    exit 1
end

set -l selection (cat "$active_file" | string trim)

switch $selection
    case ambxst
        setsid ambxst >/dev/null 2>&1 &
    case caelestia
        setsid caelestia shell >/dev/null 2>&1 &
    case dms
        setsid dms run >/dev/null 2>&1 &
    case noctalia
        setsid noctalia >/dev/null 2>&1 &
    case wayle
        setsid wayle panel start >/dev/null 2>&1 &
end
