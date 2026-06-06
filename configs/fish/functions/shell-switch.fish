function shell-switch --description "Toggle visual shell desktops in Hyprland (Lua/C++ Edition)"
    set -l shells ambxst caelestia dms noctalia noctaliav5 wayle
    set -l names Ambxst Caelestia DMS Noctalia Noctaliav5 Wayle

    if test (count $argv) -eq 0
        echo "Usage: shell-switch <ambxst|caelestia|dms|noctalia|noctaliav5|wayle>"
        return 1
    end

    set -l new_shell $argv[1]

    set -l new_idx (contains --index $new_shell $shells)
    if test -z "$new_idx"
        echo (set_color red)"[ERROR]"(set_color normal)" Unknown shell target option: $new_shell"
        return 1
    end

    # 1. Kill active shell processes 
    echo (set_color green)"[INFO]"(set_color normal)" Clearing existing shell interface..."
    kill -9 (pgrep -f ".quickshell-wra") 2>/dev/null
    pkill -9 -f quickshell 2>/dev/null
    pkill -9 -x noctalia 2>/dev/null
    pkill -9 -f noctalia-shell 2>/dev/null
    pkill -9 -f wayle 2>/dev/null
    sleep 0.5

    # 2. Update persistent state file
    set -l state_file "$HOME/.config/hypr/.active_shell"
    echo (set_color green)"[INFO]"(set_color normal)" Saving shell state selection: $new_shell"
    echo "$new_shell" >$state_file

    # 3. Resolve the launch command safely
    set -l cmd ""
    switch $new_shell
        case ambxst
            set cmd ambxst
        case caelestia
            set cmd "caelestia-shell -d"
        case dms
            set cmd "dms run"
        case noctalia
            set cmd noctalia-shell
        case noctaliav5
            set cmd noctalia
        case wayle
            set cmd "wayle shell & sleep 0.5 && wayle panel start"
    end

    # 4. Launch via Hyprland, but wrapped in Fish so the environment variables match your terminal!
    echo (set_color green)"[INFO]"(set_color normal)" Starting $new_shell..."
    hyprctl dispatch exec "fish -c '$cmd'" >/dev/null 2>&1
    sleep 1

    echo (set_color green)"[INFO]"(set_color normal)" Switched to $names[$new_idx] successfully!"
end
