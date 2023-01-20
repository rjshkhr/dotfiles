return {
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "v3.*",
		opts = {
			options = {
				separator_style = "thin",
				indicator = {
					icon = "",
					style = "icon",
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		},
	},
}
