-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP
require('lspconfig').intelephense.setup({
  commands = {
    IntelephenseIndex = {
      function()
        vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
      end,
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
  end,
  capabilities = capabilities
})

-- HTML
require'lspconfig'.html.setup({
  filetypes = {
    "html", "php", "blade", "vue"
  }
})

-- Vue, JavaScript, TypeScript
require('lspconfig').volar.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
  end,
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'javascript', 'vue' },
})

-- TypeScript Server
require'lspconfig'.tsserver.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

-- Tailwind
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- Docker-compose e Dockerfile
require('lspconfig').docker_compose_language_service.setup{}
require('lspconfig').dockerls.setup{}

-- Python
require('lspconfig').anakin_language_server.setup{}

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Sign configuration
local signs = {
  Error = '',
  Warn = '',
  Info = '',
  Hint = ''
}
vim.diagnostic.config {
  virtual_text = {
    prefix = function(diagnostic)
      return signs[vim.diagnostic.severity[diagnostic.severity]]
    end,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
}

-- Copilot configuration
vim.cmd([[
  " Alt + Enter para aceitar sugestão
  let g:copilot_no_tab_map = v:true
  imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
  
  " Ativar para o seguintes tipos de arquivos
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
