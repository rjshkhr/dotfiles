local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", ";p", '"0P', opts) -- Paste last yanked
keymap.set("n", "<esc>", ":set hlsearch!<CR>") -- Toggle search highlight

-- Panes
keymap.set("n", "<c-h>", "<c-w>h", opts)
keymap.set("n", "<c-j>", "<c-w>j", opts)
keymap.set("n", "<c-k>", "<c-w>k", opts)
keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Windows
keymap.set("n", "<leader>v", ":vsplit<CR>", opts)
keymap.set("n", "<leader>h", ":split<CR>", opts)

-- Buffers
keymap.set("n", "<tab>", ":bnext<CR>", opts)
keymap.set("n", "<s-tab>", ":bprev<CR>", opts)
keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)

-- Vertical split resize
keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")

-- Continuing indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("n", "<leader>t", ":botright 8split | terminal<CR>", opts)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
