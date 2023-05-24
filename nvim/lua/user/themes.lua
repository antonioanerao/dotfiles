-- One Dark theme.
use({
  'jessarcher/onedark.nvim',
  config = function()
    vim.cmd('colorscheme onedark')

    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })
  end,
})

-- Dracula theme.
use('dracula/vim')
