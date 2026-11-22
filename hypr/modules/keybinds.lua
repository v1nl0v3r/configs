-- =========================================================
-- Noctalia
-- =========================================================

local ipc = "noctalia msg "
local mainMod = "SUPER"

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), { description = "Open launcher" })

hl.bind(
	mainMod .. " + S",
	hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"),
	{ description = "Open control center" }
)

hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "Open settings" })

hl.bind("ALT + TAB", hl.dsp.exec_cmd(ipc .. "window-switcher hold"), { description = "Switch windows" })

-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region --copy-to-clipboard"), {
	description = "Screenshot selected area",
})

hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen --copy-to-clipboard"), {
	description = "Screenshot focused monitor",
})

hl.bind("SUPER + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"), {
	description = "Toggle clipboard history",
})
-- =========================================================
-- Applications
-- =========================================================

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"), { description = "Open terminal" })

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"), { description = "Open file manager" })

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"), { description = "Open browser" })

-- =========================================================
-- Workspace management
-- =========================================================

-- SUPER + [0-9]: switch workspace
-- SUPER + ALT + [0-9]: move window to workspace
-- SUPER + SHIFT + [0-9]: move window silently to workspace

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })

	hl.bind(
		mainMod .. " + ALT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)

	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = i,
			follow = false,
		}),
		{ description = "Move window silently to workspace " .. i }
	)
end

-- Relative workspace navigation
hl.bind(mainMod .. " + CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })

hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- =========================================================
-- Special workspace
-- =========================================================

hl.bind(mainMod .. " + GRAVE", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle special workspace" })

hl.bind(
	mainMod .. " + SHIFT + GRAVE",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move window to special workspace" }
)

-- =========================================================
-- Window focus (HJKL)
-- =========================================================

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })

hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })

hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })

-- =========================================================
-- Move windows in the layout (SHIFT + HJKL)
-- =========================================================

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })

hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })

hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })

-- =========================================================
-- Resize windows (CTRL + HJKL)
-- =========================================================

hl.bind(
	mainMod .. " + CTRL + H",
	hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
	{ description = "Resize window narrower" }
)

hl.bind(
	mainMod .. " + CTRL + J",
	hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
	{ description = "Resize window taller" }
)

hl.bind(
	mainMod .. " + CTRL + K",
	hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
	{ description = "Resize window shorter" }
)

hl.bind(
	mainMod .. " + CTRL + L",
	hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
	{ description = "Resize window wider" }
)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- =========================================================
-- Window states
-- =========================================================

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close active window" })

hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })

hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle pseudo tiling" })

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split direction" })

-- =========================================================
-- Monitor management
-- =========================================================

-- Focus adjacent monitor
hl.bind(mainMod .. " + ALT + H", hl.dsp.focus({ monitor = "-1" }), { description = "Focus previous monitor" })

hl.bind(mainMod .. " + ALT + L", hl.dsp.focus({ monitor = "+1" }), { description = "Focus next monitor" })

-- Move active window to adjacent monitor
hl.bind(
	mainMod .. " + SHIFT + ALT + H",
	hl.dsp.window.move({ monitor = "-1" }),
	{ description = "Move window to previous monitor" }
)

hl.bind(
	mainMod .. " + SHIFT + ALT + L",
	hl.dsp.window.move({ monitor = "+1" }),
	{ description = "Move window to next monitor" }
)

-- =========================================================
-- Media controls
-- =========================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("playerctl volume 0.05+"), { repeating = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("playerctl volume 0.05-"), { repeating = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

-- =========================================================
-- Brightness
-- =========================================================

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })
