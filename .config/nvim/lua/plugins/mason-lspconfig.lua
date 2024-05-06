local config = function()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      "dockerls",
      "efm",
      "emmet_ls",
      "jsonls",
      "lua_ls",
      "prismals",
      "pyright",
      "tsserver",
      "tailwindcss",
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
