require("luasnip.config").setup {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").lazy_load()
