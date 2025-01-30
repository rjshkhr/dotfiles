local config = function()
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		highlight = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = config,
}
