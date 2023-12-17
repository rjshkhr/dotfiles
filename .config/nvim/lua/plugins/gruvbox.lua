local config = function()
  require("gruvbox").setup()
  -- vim.cmd.colorscheme "gruvbox"
end

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
  config = config
}
