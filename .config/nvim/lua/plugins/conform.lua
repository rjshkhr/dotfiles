return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				-- javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				vue = { "prettierd" },
				-- html = { "prettierd" },
				-- css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				python = { "black" },
			},
			format_on_save = function(bufnr)
				-- Find git root
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")

				-- Check for .noformat in git root
				if vim.fn.filereadable(git_root .. "/.noformat") == 1 then
					return
				end

				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			end,
		})
	end,
}
