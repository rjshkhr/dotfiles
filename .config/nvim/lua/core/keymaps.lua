local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "hh", "<esc>", opts) -- hh to escape
keymap.set("n", ";p", '"0P', opts) -- paste last yanked
keymap.set("n", "<esc>", ":set hlsearch!<CR>") -- toggle search highlight

-- panes
keymap.set("n", "<c-h>", "<c-w>h", opts)
keymap.set("n", "<c-j>", "<c-w>j", opts)
keymap.set("n", "<c-k>", "<c-w>k", opts)
keymap.set("n", "<c-l>", "<c-w>l", opts)

-- windows
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- buffers
keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
keymap.set("n", "<leader>bp", ":bprev<CR>", opts)
keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)

-- nvim tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- continuing indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- save and exit
keymap.set("n", "<leader>ww", ":up<CR>", opts)
keymap.set("n", "<leader>wq", ":wq<CR>", opts)
keymap.set("n", "<leader>qq", ":q!<CR>", opts)
