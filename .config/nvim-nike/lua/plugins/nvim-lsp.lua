return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    config = function()
        -- default config for all servers
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
            root_markers = { ".git" }
        })

        -- LSP keymaps via LspAttach autocmd (on_attach doesn't work with vim.lsp.config)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf

                vim.keymap.set("n", "<leader>ca", function()
                    -- vim.lsp.buf.code_action()
                    require("fastaction").code_action()
                end, { buffer = bufnr, desc = "Code Actions" })

                vim.keymap.set("n", "<leader>d", function()
                    vim.diagnostic.open_float()
                end, { buffer = bufnr, desc = "Line Diagnostics" })

                vim.keymap.set("n", "<leader>D", function()
                    ---@diagnostic disable-next-line: undefined-global
                    Snacks.picker.diagnostics_buffer()
                end, { buffer = bufnr, desc = "Line Diagnostics" })

                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show Documentation" })

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "goto definition" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "goto definition" })
            end
        })

        -- enable the servers configured in ../../lsp
        vim.lsp.enable({
            "lua_ls",
            "sourcekit",
            "rust_analyzer"
        })

        -- change diagnostic symbols in the gutter
        local signs = { Error = "🅧 ", Warn = "⚠︎ ", Hint = "★ ", Info = "ℹ " }
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = signs.Error,
                    [vim.diagnostic.severity.WARN] = signs.Warn,
                    [vim.diagnostic.severity.HINT] = signs.Hint,
                    [vim.diagnostic.severity.INFO] = signs.Info,
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Warn",
                    [vim.diagnostic.severity.HINT] = "Hint",
                    [vim.diagnostic.severity.INFO] = "Info"
                }
            }
        })
    end
}
