local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

-- space is the leader
g.mapleader = ' '

-- hh to escape
map('i', 'hh', '<esc>', { noremap = true })

-- window navigation
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

-- buffer navigation
map('n', '<C-n>', ':bnext<CR>', { noremap = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true })

-- continuing indentation
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- copy, paste using system clipboard
map('v', '<C-c>', '"+y',    { noremap = true })
map('i', '<C-v>', '<C-r>+', { noremap = true })

-- paste last yanked
map('', ';p', '"0P', { noremap = true })

-- screen line movement
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })

-- auto close
-- map('i', '"', '""<left>', { noremap = true })
-- map('i', "'", "''<left>", { noremap = true })
-- map('i', '(', '()<left>', { noremap = true })
-- map('i', '[', '[]<left>', { noremap = true })
-- cmd [[inoremap {<cr> {<cr>}<esc>O]]

-- remove search highlight
map('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true })

-- save and exit
map('n', '<Leader>w', ':up<CR>', { noremap = true })
map('n', '<Leader>q', ':wq<CR>', { noremap = true })
map('n', '<Leader>qq', ':q!<CR>', { noremap = true })
