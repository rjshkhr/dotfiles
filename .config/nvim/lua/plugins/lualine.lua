return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = "|",
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "", right = "" }, right_padding = 2 },
      },
      lualine_b = {
        {
          "filename",
          path = 1, -- 1 = relative path
          symbols = {
            modified = "", -- Text to show when the file is modified.
            readonly = "", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
            newfile = "[New]", -- Text to show for newly created file before first write
          },
        },
      },
      lualine_c = {
        "branch",
        "diff",
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", hint = " ", info = " " },
          update_in_insert = true, -- update diagnostics in insert mode
        },
      },
      lualine_x = { "searchcount", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { left = "",  right = "" }, left_padding = 2 },
      },
    },
  },
}
