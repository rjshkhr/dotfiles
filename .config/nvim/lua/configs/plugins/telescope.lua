return {
	{
		"nvim-telescope/telescope.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		keys = {
			{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			-- find
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
			-- git
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
			-- search
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
			{ "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
			{
				"<leader>ss",
				desc = "Goto Symbol",
			},
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search Current Word" },
			-- file browser
			{ ";e", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
		},
		opts = function()
			return {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						hijack_netrw = true,
						hidden = true,
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
		end,
	},
}
