require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = {
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = {
            hint = '  ',
          },
          sections = { 'error', 'warn', 'info', 'hint' },
        },
        'progress',
      },
      lualine_y = { 'filetype' },
      lualine_z = { 'location' }
    }
  })
