return {
	"mbrea-c/wal-colors.nvim",
	config = function()
		vim.cmd([[colorscheme mbc]]) -- activate the colorscheme
	end,
	priority = 1000, -- recommended to ensure the colorscheme
	-- is loaded before other plugins
}
