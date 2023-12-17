local ensure_installed = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"git_config",
	"gitcommit",
	"gitignore",
	"html",
	"ini",
	"javascript",
	"json",
	"jsonc",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"scss",
	"tsx",
	"typescript",
	"vim",
	"xml",
	"yaml",
}

local config = function()
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		ensure_installed = ensure_installed,
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
