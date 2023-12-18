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
keymap.set("n", "<leader>v", ":vsplit<CR>", opts)
keymap.set("n", "<leader>h", ":split<CR>", opts)

-- buffers
keymap.set("n", "<tab>", ":bnext<CR>", opts)
keymap.set("n", "<s-tab>", ":bprev<CR>", opts)
keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)

-- vertical split size
keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")

-- nvim tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", opts)

-- continuing indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- move lines
keymap.set("v", "<shift>j", ":m '>+1<CR>gv=gv")
keymap.set("v", "<shift>k", ":m '>-2<CR>gv=gv")

-- save and exit
keymap.set("n", "<leader>ww", ":up<CR>", opts)
keymap.set("n", "<leader>wq", ":wq<CR>", opts)
keymap.set("n", "<leader>qq", ":q!<CR>", opts)
