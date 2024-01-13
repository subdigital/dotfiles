return {
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/vim-vsnip-integ" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" },
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      --
      -- -- change a keymap
      -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<CR>" }
    end,
    setup = function()
      local lspconfig = require("lspconfig")
      local lsp = require("lsp")
      local capabilities = lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.sourcekit.setup({
        on_attach = lsp.on_attach,
        capabilities = capabilities,
      })
    end,
  }
}
