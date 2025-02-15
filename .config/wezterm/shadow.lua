local M = {}

M.colors = {
	foreground = "#E6E7E6",
	background = "#1D2326",
	cursor_bg = "#9CA3AF",
	cursor_fg = "#1D2326",
	cursor_border = "#9CA3AF",
	selection_fg = "#1D2326",
	selection_bg = "#E6E7E6",
	split = "#485457",
	ansi = {
		"#242B2D",
		"#BC8F7D",
		"#96B088",
		"#CCAC7D",
		"#7E9AAB",
		"#A68CAA",
		"#839C98",
		"#CED3DC",
	},
	brights = {
		"#485457",
		"#D4A394",
		"#ABC49E",
		"#E2BF8F",
		"#94B1C4",
		"#BC9EC0",
		"#97B3AF",
		"#E8EBF0",
	},
	tab_bar = {
		background = "#1D2326",
		active_tab = {
			bg_color = "#242B2D",
			fg_color = "#E6E7E6",
		},
		inactive_tab = {
			bg_color = "#1D2326",
			fg_color = "#839C98",
		},
		inactive_tab_hover = {
			bg_color = "#242B2D",
			fg_color = "#CED3DC",
		},
		new_tab = {
			bg_color = "#1D2326",
			fg_color = "#839C98",
		},
		new_tab_hover = {
			bg_color = "#242B2D",
			fg_color = "#CED3DC",
		},
	},
}

return M
