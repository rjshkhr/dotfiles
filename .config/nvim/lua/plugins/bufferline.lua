require('bufferline').setup {
  options = {
      numbers = "ordinal",
      show_close_icon = false,
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      offsets = {{
        filetype = "NvimTree",
        text = "Files ",
        highlight = "Directory",
        text_align = "left"
    }},
  }
}
