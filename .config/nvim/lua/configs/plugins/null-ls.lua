return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		opts = function()
			local nls = require("null-ls")
			local code_actions = nls.builtins.code_actions
			local diagnostics = nls.builtins.diagnostics
			local formatting = nls.builtins.formatting
			return {
				sources = {
					code_actions.xo,
					diagnostics.eslint_d,
					diagnostics.zsh,
					formatting.stylua,
					formatting.prettierd,
					formatting.beautysh,
					formatting.black,
				},
				on_attach = function(current_client, bufnr)
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			}
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"black",
				"shfmt",
				"stylua",
				"zsh",
				"beautysh",
				"black",
				"xo",
			},
			automatic_installation = true,
		},
	},
}
