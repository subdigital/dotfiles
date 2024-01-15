return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- complete from buffer
    "hrsh7th/cmp-path", -- complete from fs paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- autocomplete snippets
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- loads vscode style snippets from installed plugins
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

      completion = {
        completeopt = "menu,menuone,preview,noselect"
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<c-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false}),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

    })
  end
}

