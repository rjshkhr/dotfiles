local config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"dockerls",
			"jsonls",
			"lua_ls",
			"prismals",
			"pyright",
			"ts_ls",
			"tailwindcss",
			"rust_analyzer",
		},

		automatic_installation = true,
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = "williamboman/mason.nvim",
	event = "BufReadPre",
	config = config,
}
