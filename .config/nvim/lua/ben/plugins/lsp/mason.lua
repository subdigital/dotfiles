return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "→",
          package_uninstalled = "🅧",
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "lua_ls",
        "ts_ls",
      },
      -- install configured servers with lspconfig automatically
      automatic_installation = true,
    })
  end
}
