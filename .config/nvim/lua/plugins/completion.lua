local api = vim.api
local fn = vim.fn
local map = vim.api.nvim_set_keymap

require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    buffer = true,
    calc = false,
    nvim_lua = false,
  },
}

local t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
  if fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if fn.pumvisible() == 1 then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end

map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
map('i', '<c-space>', 'compe#complete()', { expr = true })
