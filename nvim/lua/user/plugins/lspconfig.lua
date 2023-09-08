-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP
require('lspconfig').intelephense.setup({ capabilities = capabilities })

-- Vue, JavaScript, TypeScript
require('lspconfig').volar.setup({
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json', 'php' },
  init_options = {
    typescript = {
      -- path to typescript lib folder
      tsdk = '/home/antonio/.nvm/versions/node/v18.17.1/lib/node_modules/typescript/lib'
    }
  }
})

-- Tailwind
require('lspconfig').tailwindcss.setup({
  filetypes = { 
    "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", 
    "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", 
    "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", 
    "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", 
    "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte"
  } 
})

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

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

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
  \ }

  " Cor da sugestão em #555555
  highlight CopilotSuggestion guifg=#555555 ctermfg=8
]])


