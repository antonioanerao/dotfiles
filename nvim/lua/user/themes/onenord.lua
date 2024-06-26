require('onenord').setup({
  theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = true, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color
    float_background = false, -- Disable setting the background color for floating windows
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
vim.o.background = "dark"
vim.cmd('colorscheme onenord')
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e222a', fg = '#abb2bf' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1e222a', fg = '#1e222a' })

-- Telescope
vim.cmd([[
  highlight TelescopePromptNormal guibg=#3b4252 guifg=#9aa1ad
  highlight TelescopePromptCounter guifg=#9aa1ad
  highlight TelescopePromptBorder guifg=#747474 guibg=#3b4252
  highlight TelescopePromptTitle guifg=#9AA1AD
  highlight TelescopeResultsTitle guifg=#9AA1AD
  highlight TelescopePreviewTitle guifg=#9AA1AD
  highlight TelescopePromptPrefix guifg=#9AA1AD
]])
