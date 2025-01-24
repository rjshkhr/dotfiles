vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- disable new line comments

-- highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- remove all white spaces at the end of the file on save
vim.cmd([[au BufWritePre * %s/\s\+$//e]])
vim.cmd([[au BufWritePre * %s/\n\+\%$//e]])

-- terminal
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd("startinsert")
	end,
})
