----------------
--- MONITORS ---
----------------

hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "DP-2", mode = "preferred", position = "auto-left", scale = "auto" })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-right", scale = "auto" })

hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true, layout = "scrolling" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true, layout = "scrolling" })
