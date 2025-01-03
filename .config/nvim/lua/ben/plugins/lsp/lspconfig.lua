return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap=true, silent=true }
    local on_attach = function(client, bufnr)
      -- opts.bufnr = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<cr>", opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gT", "<cmd>Telescope lsp_type_definitions<cr>", opts)

      opts.desc = "Show code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Goto next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Goto previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Show documentation"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- change diagnostic symbols in the gutter
    local signs = { Error = "🅧 ", Warn = "⚠️ ", Hint = "★ ", Info = "ℹ " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure the language servers
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "html.erb" }
    })

    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make lua_ls recognize the vim global variable
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            -- make the library aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config")] = true,
            }
          }
        }
      }
    })

    -- lspconfig["solargraph"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach
    -- })

    lspconfig["ruby_lsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "mise", "x", "--", "ruby-lsp" },
      init_options = {
        formatters = {'standard'},
        linters = {'standard'}
      }
    })

    lspconfig["standardrb"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "mise", "x", "--", "standardrb", "--lsp" }
    })

    lspconfig["sourcekit"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- lspconfig["rust_analyzer"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach
    --
    -- })
  end
}
