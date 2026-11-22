-- Hardware
require("hardware.monitors")

-- Core configuration
require("modules.environment")
require("modules.appearance")
require("modules.animations")
require("modules.layout")
require("modules.input")

-- Window management
require("modules.keybinds")
require("modules.windowrules")
require("modules.gestures")

-- Noctalia theme integration
require("noctalia").apply_theme()

-- Startup
require("modules.autostart")

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
})
