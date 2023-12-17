local on_attach = function(_, bufnr)
	local keymap = vim.keymap
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "gr", vim.lsp.buf.references, opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
end

local config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabalities = capabilities,
		settings = { -- custom settings for lua
			Lua = {
				runtime = {
					-- tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	})

	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabalities = capabilities,
	})

	lspconfig.tailwindcss.setup({})

	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					autoImportCompletions = true,
				},
			},
		},
	})

	lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local eslint = require("efmls-configs.linters.eslint")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"html",
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"jsonc",
			"svelte",
			"vue",
			"python",
			"sh",
			"docker",
			"markdown",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				javascript = { eslint, prettier_d },
				javascriptreact = { eslint, prettier_d },
				typescript = { eslint, prettier_d },
				typescriptreact = { eslint, prettier_d },
				svelte = { eslint, prettier_d },
				vue = { eslint, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
				markdown = { prettier_d },
				json = { fixjson },
				jsonc = { fixjson },
				sh = { shellcheck, shfmt },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"creativenull/efmls-configs-nvim",
	},
	config = config,
}
