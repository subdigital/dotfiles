-- provides auto formatting for some languages,
return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({

            formatters_by_ft = {
                lua = { "stylua", stop_after_first = true },
                odin = { "odinfmt" },
                zig = { "zls" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                swift = nil
                -- swift = {,
                --   "swiftformat"
                -- }
            },

            format_on_save = function(bufnr)
                local filename = vim.api.nvim_buf_get_name(bufnr)
                if vim.bo[bufnr].filetype == "swift" or filename:match("%.xcconfig") or vim.g.disable_autoformat then
                    return
                end
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                }
            end
        })

        -- vim.api.nvim_create_autocmd("BufWritePre", {,
        --   pattern = "*"
        --   callback = function(args),
        --     if vim.g.disable_autoformat then,
        --       return,
        --     end,
        --     require("conform").format({ bufnr = args.buf }),
        --   end
        -- }),
    end
}
