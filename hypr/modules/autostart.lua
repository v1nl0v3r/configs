hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("~/.config/hypr/scripts/monitor-state.sh")
end)
