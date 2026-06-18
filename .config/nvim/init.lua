vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.updatetime = 250
vim.o.confirm = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<esc>", ":set hlsearch!<cr>", { silent = true })

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>t", ":botright 12split | terminal<cr>", { silent = true })
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<tab>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<s-tab>", ":bprev<cr>", { silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete!<cr>", { silent = true })

vim.keymap.set("n", "<leader>sv", ":vsplit<cr>")
vim.keymap.set("n", "<leader>sh", ":split<cr>")

vim.keymap.set("n", "<leader>w", ":w<cr>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

vim.cmd([[au BufWritePre * %s/\s\+$//e]])
vim.cmd([[au BufWritePre * %s/\n\+\%$//e]])

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.pack.add({
	"https://github.com/rjshkhr/shadow.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mfussenegger/nvim-lint",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

vim.opt.termguicolors = true
vim.cmd.colorscheme("shadow")

require("nvim-treesitter").install({
	"bash",
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

require("mini.pairs").setup()

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	float = {
		max_width = 60,
		border = "none",
	},
	confirmation = {
		border = "none",
	},
})

vim.keymap.set("n", "<leader>ee", ":Oil<cr>", { silent = true })
vim.keymap.set("n", "<leader>ef", ':lua require("oil").toggle_float()<cr>', { silent = true })

require("telescope").setup({
	defaults = {
		borderchars = { "" },
	},
})

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { silent = true })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		javascript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		html = { "prettier" },
		css = { "biome", "prettier", stop_after_first = true },
		json = { "jq" },
		python = { "isort", "black" },
		bash = { "shfmt" },
	},
	format_on_save = function(bufnr)
		local root = vim.fs.root(bufnr, ".git")
		if root and vim.uv.fs_stat(root .. "/.noformat") then
			return
		end
		return {
			lsp_format = "fallback",
			timeout_ms = 1000,
		}
	end,
})

require("lint").linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	javascriptreact = { "biomejs" },
	typescriptreact = { "biomejs" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		local root = vim.fs.root(0, { "biome.json", "package.json" }) or vim.fn.getcwd()
		local has_biome = vim.fn.filereadable(root .. "/biome.json") == 1

		if has_biome then
			require("lint").try_lint("biomejs")
		else
			require("lint").try_lint()
		end
	end,
})

vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "tailwindcss", "gopls", "rust_analyzer" })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			telemetry = { enable = false },
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<leader>=", function()
			vim.lsp.buf.format({ async = false })
		end, opts)
		vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, opts)
	end,
})

vim.diagnostic.config({
	virtual_text = { prefix = "" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})

require("blink.cmp").setup()

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

vim.o.statusline = table.concat({
	"%#Keyword#",
	" %{toupper(mode())} ",
	"%#StatusLine#",
	"%#StatusFileName#",
	"%f ",
	"%#StatusLine#",
	"%{&modified ? '' : ''}",
	"%=",
	"%#Comment#",
	"%y ",
	"%#StatusLine#",
	"%#Identifier#",
	"%l:%c ",
	"%#StatusLine#",
	"%#String#",
	"%p%% ",
})
