vim.cmd('colorscheme onedark')

vim.api.nvim_set_hl(0, 'FloatBorder', {bg='#3B4252', fg='#3B4252'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#3B4252'})

 -- Make the cursor line background invisible
vim.api.nvim_set_hl(0, 'CursorLineBg', {
  fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
  bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
})

vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
