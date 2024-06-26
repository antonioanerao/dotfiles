local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- One Dark theme.
use({
  'rmehri01/onenord.nvim',
  config = function()
    require('user/themes/onenord')
  end,
})

-- Display buffers as tabs.
use({
  'akinsho/bufferline.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  after = 'onenord.nvim',
  config = function()
    require('user/plugins/bufferline')
  end,
})

use({'nvim-tree/nvim-web-devicons'})

-- Dashboard
use({
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
         enable = false,
        },
        shortcut = {
          { icon = ' ', icon_hl = '@variable', desc = 'Update', group = '@property', action = 'PackerSync', key = 'u' },
          { icon = ' ', icon_hl = '@variable', desc = 'Tree', group = '@property', action = 'NvimTreeFindFile', key = 't' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Search',
            group = 'Label',
            action = 'Telescope live_grep',
            key = 's',
          },
        },
        footer = {},
      },
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
})

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Commenting support. Press GCC after visual selecting
use 'tpope/vim-commentary'

-- Add, change and delete surrounding text. https://github.com/tpope/vim-surround
-- use('tpope/vim-surround')

-- Ident autodetection
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands pressig .
-- use('tpope/vim-repeat')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Highlight html and blade files
use('jwalton512/vim-blade')

-- Markdown
use({
  "tadmccorkle/markdown.nvim",
  config = function()
    require("markdown").setup({})
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Add smooth scrolling to avoid jarring jumps
use({
  'karb94/neoscroll.nvim',
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local opts = {
        mappings = {
          "<C-u>",
          "<C-d>",
        },
      }
      require("neoscroll").setup(opts)
  end,
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    require('user/plugins/gitsigns')
  end,
})

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    require('user/plugins/bufdelete')
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up. 
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    require('user/plugins/splitjoin')
  end,
})

-- Automatically fix indentation when pasting code.
use({
  'sickill/vim-pasta',
  config = function()
    require('user/plugins/vim-pasta')
  end,
})

-- Fuzzy finder
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

--Tests 
use({
  'vim-test/vim-test',
  config = function()
    require('user/plugins/vim-test')
  end,
})

-- File tree sidebar
use({
  'nvim-tree/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
})

-- A Status line.
use({
  'nvim-lualine/lualine.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('user/plugins/lualine')
  end,
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('user/plugins/indent-blankline')
  end,
})

--- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    require('user/plugins/vim-floaterm')
  end,
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user/plugins/treesitter')
  end,
})

-- Language Server Protocol.
use({
  'neovim/nvim-lspconfig', commit = '9ea0e83a547017b8d88292d9cbbfae6c01c108c1',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'github/copilot.vim',
  },
  config = function()
    require('user/plugins/lspconfig')
  end,
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins/cmp')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    require('user/plugins/phpactor')
  end,
})

-- A plugin for setting the commentstring option based on the cursor location in the file
use({
  'JoosepAlviste/nvim-ts-context-commentstring',
  config = function()
    require('user/plugins/nvim-ts-context-commentstring')
  end,
})

if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> 
  augroup end
]])
