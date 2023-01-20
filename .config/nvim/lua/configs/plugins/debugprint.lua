return {
  url = "git@github.com:andrewferrier/debugprint.nvim",
  config = function()
    require("debugprint").setup()
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = "g?",
}
