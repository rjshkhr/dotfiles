return {
	"rjshkhr/shadow.nvim",
	-- dir = "~/Projects/personal/shadow.nvim",
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("shadow")
	end,
}
