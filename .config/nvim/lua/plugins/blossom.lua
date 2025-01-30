return {
	"rjshkhr/blossom.nvim",
	-- dir = "~/Projects/blossom.nvim",
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("blossom")
	end,
}
