return {
	-- "rjshkhr/shadow.nvim",
	dir = "~/Projects/shadow.nvim",
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("shadow")
	end,
}
