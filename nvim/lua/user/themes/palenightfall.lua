vim.cmd('colorscheme palenightfall')

-- vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'CursorLineBg', {bg='#30323E', fg='#777777'})

-- Telescope
vim.cmd([[
  " highlight TelescopePromptNormal guibg=#3b4252 guifg=#9aa1ad
  " highlight TelescopePromptCounter guifg=#9aa1ad
  " highlight TelescopePromptBorder guifg=#747474 guibg=#3b4252
  " highlight TelescopePromptTitle guifg=#9AA1AD
  " highlight TelescopeResultsTitle guifg=#9AA1AD
  " highlight TelescopePreviewTitle guifg=#9AA1AD
  " highlight TelescopePromptPrefix guifg=#9AA1AD

  " highlight TelescopeBorder guifg=#d3d3d3 guibg=#1e222a
  " highlight TelescopeResultsBorder guifg=#777777 guibg=#30323E
  " highlight TelescopePreviewBorder guifg=#d3d3d3 guibg=#1e222a
  " highlight TelescopeSelection guibg=#CCCCCC
  " highlight TelescopeSelectionCaret guifg=#61afef
]])

 -- Make the cursor line background invisible
-- vim.api.nvim_set_hl(0, 'CursorLineBg', {
--   fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
--   bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
-- })

-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
