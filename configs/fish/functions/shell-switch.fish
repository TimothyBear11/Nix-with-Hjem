function shell-switch --description "Toggle visual shell desktops in Hyprland (Lua Edition)"
    # Define our core shell data using clean Fish lists
    set -l shells     "ambxst" "caelestia" "dms" "noctalia" "end4"
    set -l names      "Ambxst" "Caelestia" "DMS" "Noctalia" "End4"
    set -l launch_cmds "ambxst" "caelestia-shell -d" "dms run" "noctalia-shell" "qs -c illogical-impulse"

    # Color definitions using native fish set commands
    set -l RED    (set_color red)
    set -l GREEN  (set_color green)
    set -l YELLOW (set_color yellow)
    set -l NC     (set_color normal)

    # If no argument is passed, show usage instructions
    if test (count $argv) -eq 0
        echo "Usage: shell-switch <ambxst|caelestia|dms|noctalia|end4>"
        return 1
    end

    set -l new_shell $argv[1]

    # Fish native list indexing to find the selected target index
    if not set -l new_idx (contains --index $new_shell $shells)
        echo -e "${RED}[ERROR]${NC} Unknown shell target option: $new_shell"
        return 1
    end

    # 1. Kill the active canvas wrapper processes
    echo -e "${GREEN}[INFO]${NC} Clearing existing shell interface..."
    kill -9 (pgrep -f ".quickshell-wra") 2>/dev/null
    pkill -9 -f "quickshell" 2>/dev/null
    sleep 0.5

    # 2. Update the persistent state file for your autostart.lua to read
    set -l state_file "$HOME/.config/hypr/.active_shell"
    echo -e "${GREEN}[INFO]${NC} Saving shell state selection: $new_shell"
    echo "$new_shell" > $state_file

    # 3. Fire up the newly chosen shell instantly in the background
    echo -e "${GREEN}[INFO]${NC} Starting $new_shell..."
    eval $launch_cmds[$new_idx] >/dev/null 2>&1 &
    sleep 1
    echo -e "${GREEN}[INFO]${NC} Switched to $names[$new_idx] successfully!"
end