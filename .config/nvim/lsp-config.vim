
" Commands
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>h <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>

" Auto format
autocmd BufWritePost *.rb lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePost *.swift lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePost *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePost *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePost *.rs lua vim.lsp.buf.formatting_sync(nil, 300)

lua << EOS
  -- language configs
  local lspconfig = require'lspconfig'

  lspconfig.sourcekit.setup{}
  lspconfig.eslint.setup{}
  lspconfig.tsserver.setup{}
  lspconfig.solargraph.setup{
    filetypes = { "ruby" },
    flags = { debounce_text_changes = 500 }
  }
  lspconfig.tailwindcss.setup{}
  lspconfig.rust_analyzer.setup{}

  -- setup fidget to show progress
  require'fidget'.setup{}
EOS
