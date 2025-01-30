return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({

      formatters_by_ft = {
        lua = { "stylua", stop_after_first = true },
        zig = { "zls" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },

      format_on_save = function(bufnr)
        if vim.g.disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        if vim.g.disable_autoformat then
          return
        end
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
