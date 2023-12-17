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

-- format on save
local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = lsp_fmt_group,
  callback = function(ev)
    local efm = vim.lsp.get_active_clients({ name = 'efm', bufnr = ev.buf })

    if vim.tbl_isempty(efm) then
      return
    end

    vim.lsp.buf.format({ name = 'efm' })
  end,
})
