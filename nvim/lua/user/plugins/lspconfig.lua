-- Mason
require('mason').setup()

require('mason-lspconfig').setup({
  automatic_installation = true,
})

-- Capabilities do nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- ============================================================================
-- PHP - Intelephense
-- ============================================================================

vim.lsp.config('intelephense', {
  commands = {
    IntelephenseIndex = {
      function()
        vim.lsp.buf.execute_command({
          command = 'intelephense.index.workspace',
        })
      end,
    },
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    -- end
  end,

  capabilities = capabilities,
})

vim.lsp.enable('intelephense')


-- ============================================================================
-- HTML
-- ============================================================================

vim.lsp.config('html', {
  filetypes = {
    'html',
    'php',
    'blade',
    'vue',
  },

  capabilities = capabilities,
})

vim.lsp.enable('html')


-- ============================================================================
-- Vue / JavaScript
-- ============================================================================

vim.lsp.config('volar', {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    -- end
  end,

  capabilities = capabilities,

  filetypes = {
    'javascript',
    'vue',
  },
})

vim.lsp.enable('volar')


-- ============================================================================
-- TypeScript / JavaScript
-- ============================================================================

vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
        languages = {
          'javascript',
          'typescript',
          'vue',
        },
      },
    },
  },

  filetypes = {
    'javascript',
    'typescript',
    'vue',
  },

  capabilities = capabilities,
})

vim.lsp.enable('ts_ls')


-- ============================================================================
-- Tailwind CSS
-- ============================================================================

vim.lsp.config('tailwindcss', {
  capabilities = capabilities,
})

vim.lsp.enable('tailwindcss')


-- ============================================================================
-- JSON
-- ============================================================================

vim.lsp.config('jsonls', {
  capabilities = capabilities,

  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

vim.lsp.enable('jsonls')


-- ============================================================================
-- Docker
-- ============================================================================

vim.lsp.config('docker_compose_language_service', {})
vim.lsp.enable('docker_compose_language_service')

vim.lsp.config('dockerls', {})
vim.lsp.enable('dockerls')


-- ============================================================================
-- Python
-- ============================================================================

vim.lsp.config("anakin_language_server", {
    cmd = { "anakinls" },
    filetypes = { "python" },
})

vim.lsp.enable("anakin_language_server")

-- ============================================================================
-- Lua
-- ============================================================================

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name

      if
        path ~= vim.fn.stdpath('config')
        and (
          vim.uv.fs_stat(path .. '/.luarc.json')
          or vim.uv.fs_stat(path .. '/.luarc.jsonc')
        )
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend(
      'force',
      client.config.settings.Lua,
      {
        runtime = {
          version = 'LuaJIT',

          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },

        workspace = {
          checkThirdParty = false,

          library = {
            vim.env.VIMRUNTIME,
          },
        },
      }
    )
  end,

  settings = {
    Lua = {},
  },

  capabilities = capabilities,
})

vim.lsp.enable('lua_ls')


-- ============================================================================
-- Keymaps
-- ============================================================================

vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)


-- ============================================================================
-- Diagnostics
-- ============================================================================

local signs = {
  Error = '',
  Warn = '',
  Info = '',
  Hint = '',
}

vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      return signs[vim.diagnostic.severity[diagnostic.severity]]
    end,
  },

  update_in_insert = true,
  underline = true,
  severity_sort = true,
})


-- ============================================================================
-- Copilot
-- ============================================================================

vim.cmd([[
  " Alt + Enter para aceitar sugestão
  let g:copilot_no_tab_map = v:true
  imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")

  " Ativar para os seguintes tipos de arquivos
  let g:copilot_filetypes = {
    \ '*': v:false,
    \ 'python': v:true,
    \ 'lua': v:true,
    \ 'php': v:true,
    \ 'html': v:true,
    \ 'javascript': v:true,
  \ }

  " Cor da sugestão em #555555
  highlight CopilotSuggestion guifg=#555555 ctermfg=8
]])
