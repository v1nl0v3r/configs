hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 12,
		border_size = 2,
		resize_on_border = false,
		allow_tearing = false,
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "0xee1a1a1a",
		},

		blur = {
			enabled = true,
			size = 6,
			passes = 2,
			vibrancy = 0.2,
		},
	},

	layers = {
		allow_new_top_layers_over_existing_fullscreen = true,
	},
})
