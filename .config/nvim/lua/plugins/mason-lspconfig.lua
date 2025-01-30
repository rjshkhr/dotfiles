local config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"pyright",
			"bashls",
			"ts_ls",
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
