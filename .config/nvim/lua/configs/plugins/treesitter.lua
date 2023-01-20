return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter-context" },
		opts = {
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			autopairs = { enable = true },
			autotag = { enable = true },
			indent = { enable = true },
			ensure_installed = "all",
			ignore_install = {},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			require("treesitter-context").setup({})
		end,
	},
}
