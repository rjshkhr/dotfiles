local opt = vim.opt

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive when uppercase
opt.undofile = true -- enable undo file
opt.swapfile = false -- disable swap file
opt.showmode = false
opt.iskeyword:append("-") -- treat words separated by - as one word
opt.clipboard:append("unnamedplus") -- enable copying to system clipboard

-- splits
opt.splitbelow = true
opt.splitright = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- lines
opt.number = true
opt.relativenumber = true
opt.wrap = true

-- appearance
opt.termguicolors = true
opt.scrolloff = 10
opt.sidescrolloff = 10
