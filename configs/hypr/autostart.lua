-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
    -- Critical System Services
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("/usr/libexec/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("kdeconnect-indicator")

    -- Theme & Aesthetic (Marchborn Guardian)
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("noctalia-shell")

    -- Workspace-Specific Favorites
    hl.exec_cmd("[workspace 2] sleep 3 && zed")
    hl.exec_cmd("[workspace 3] sleep 4 && steam")
    hl.exec_cmd("[workspace 4] sleep 2 && floorp")
    hl.exec_cmd("[workspace 5] sleep 2 && kitty -e btop")
end)
