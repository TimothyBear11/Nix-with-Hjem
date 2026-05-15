-------------------
--- KEYBINDINGS ---
-------------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local noct = "noctalia-shell ipc call"

local mainMod = "SUPER"

-- Basic commands
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("kate"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("positron"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("joplin"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("floorp"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty -e nvim"))
hl.bind(mainMod .. " + F", hl.dsp.fullscreen("0"))

-- Noctalia shell commands
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(noct .. " launcher toggle"))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(noct .. " controlCenter toggle"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd(noct .. " settings toggle"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd(noct .. " launcher clipboard"))
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd(noct .. " sessionMenu toggle"))

-- Music controls
hl.bind(mainMod .. " + Up", hl.dsp.exec_cmd("music-play"))
hl.bind(mainMod .. " + Down", hl.dsp.exec_cmd("music-pause"))
hl.bind(mainMod .. " + Right", hl.dsp.exec_cmd("music-next"))
hl.bind(mainMod .. " + Left", hl.dsp.exec_cmd("music-play"))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.exec_cmd("music-prev"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noct .. " volume increase"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noct .. " volume decrease"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noct .. " volume muteOutput"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noct .. " brightness increase"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noct .. " brightness decrease"), { repeating = true, locked = true })
