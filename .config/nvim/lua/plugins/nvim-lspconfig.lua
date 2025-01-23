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
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	})

	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabalities = capabilities,
	})

	lspconfig.tailwindcss.setup({})

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

	lspconfig.prismals.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.rust_analyzer.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = config,
}
