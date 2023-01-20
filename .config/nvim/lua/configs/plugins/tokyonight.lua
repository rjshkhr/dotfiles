return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = {
      style = "storm",
      lualine_bold = true,
      -- lualine background
      on_colors = function(c)
        c.bg_statusline = c.bg
      end,
      on_highlights = function(hl, c)
        -- borderless telescope
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        -- borderless nvim-notify
        hl.NotifyTRACEBorder = {
          fg = c.bg,
        }
        hl.NotifyERRORBorder = {
          fg = c.bg,
        }
        hl.NotifyINFOBorder = {
          fg = c.bg,
        }
        hl.NotifyTRACEBorder = {
          fg = c.bg,
        }
        hl.NotifyWARNBorder = {
          fg = c.bg,
        }
      end,
    },
  },
}
