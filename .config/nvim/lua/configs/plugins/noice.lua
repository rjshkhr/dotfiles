return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		presets = { inc_rename = true },
		lsp = {
			message = {
				-- Messages shown by lsp servers
				enabled = true,
				view = "notify",
				opts = {},
			},
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		views = {
			cmdline_popup = {
				border = {
					style = "none",
					padding = { 1, 3 },
				},
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				filter_options = {},
				win_options = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "none",
					padding = { 1, 3 },
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
	},
	config = function(_, opts)
		require("noice").setup(opts)
	end,
}
