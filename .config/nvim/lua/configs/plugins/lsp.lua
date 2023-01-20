return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "smjonas/inc-rename.nvim", opts = {
				cmd_name = "LspRename",
			} },
		},
		opts = {
			diagnostics = {
				underline = false,
				update_in_insert = false,
				virtual_lines = { prefix = "●" },
				virtual_text = false,
				float = {
					source = "always",
					header = "",
				},
				severity_sort = true,
			},
			servers = {
				tsserver = {},
				jsonls = {},
				cssls = {},
				html = {},
				cssmodules_ls = {},
				tailwindcss = {},
				pyright = {},
				vimls = {},
				bashls = {},
				yamlls = {},
				sumneko_lua = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = { checkThirdParty = false },
							telemetry = {
								enable = false,
							},
						},
					},
				},
			},
			on_attach = function(_, bufnr)
				local options = { noremap = true, silent = true }
				vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, options)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
				vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, options)

				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<CR>", bufopts)
				-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>rn", function()
					return ":LspRename " .. vim.fn.expand("<cword>")
				end, {
					expr = true,
					buffer = bufnr,
				})
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
				vim.keymap.set("n", "<space>p", function()
					vim.lsp.buf.format({ sync = true })
				end, bufopts)
			end,
		},
		config = function(_, opts)
			vim.diagnostic.config(opts.diagnostics)

			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local servers = opts.servers

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			})

			require("mason-lspconfig").setup_handlers({
				function(server)
					local server_opts = servers[server] or {}
					server_opts.capabilities = capabilities
					server_opts.on_attach = opts.on_attach
					require("lspconfig")[server].setup(server_opts)
				end,
			})
		end,
	},
}
