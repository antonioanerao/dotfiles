local highlight = {
    "RainbowRed",
}
local hooks = require "ibl.hooks"

hooks.register(
    hooks.type.HIGHLIGHT_SETUP, 
    function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#A2A8B3" })
    end
)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup {
    scope = { 
        char = "▏",
        highlight = highlight,
    },
    exclude = {
        filetypes = {
          'help',
          'terminal',
          'dashboard',
          'packer',
          'lspinfo',
          'TelescopePrompt',
          'TelescopeResults',
        },
        buftypes = {
            'terminal',
            'NvimTree',
        }
    },
}
