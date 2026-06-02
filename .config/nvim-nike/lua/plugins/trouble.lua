return {
    {
        "folke/trouble.nvim",
        opts = {
            win = { position = "right", size = 0.25 },
            modes = {
                qflist = {
                    win = { position = "bottom" },
                },
                loclist = {
                    win = { position = "bottom" },
                },
            },
            specs = {
                "folke/snacks.nvim",
                opts = function(_, opts)
                    return vim.tbl_deep_extend("force", opts or {}, {
                        picker = {
                            actions = require("trouble.sources.snacks").actions,
                            win = {
                                input = {
                                    keys = {
                                        ["<c-t>"] = {
                                            "trouble_open",
                                            mode = { "n", "i" },
                                        },
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>cx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Workspace diagnostics",
            },
            {
                "<leader>cb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer diagnostics",
            },
            {
                "<leader>cl",
                function()
                    local diagnostics = vim.diagnostic.get(0)
                    local items = {}
                    for _, d in ipairs(diagnostics) do
                        table.insert(items, {
                            bufnr = d.bufnr or 0,
                            lnum = d.lnum + 1,
                            col = d.col + 1,
                            text = d.message,
                            type = d.severity == vim.diagnostic.severity.ERROR and "E"
                                or d.severity == vim.diagnostic.severity.WARN and "W"
                                or d.severity == vim.diagnostic.severity.INFO and "I"
                                or "H",
                        })
                    end
                    vim.fn.setloclist(0, items)
                    vim.cmd("Trouble loclist toggle")
                end,
                desc = "Loclist diagnostics",
            },
            {
                "<leader>cq",
                function()
                    local diagnostics = vim.diagnostic.get()
                    local items = {}
                    for _, d in ipairs(diagnostics) do
                        table.insert(items, {
                            bufnr = d.bufnr or 0,
                            lnum = d.lnum + 1,
                            col = d.col + 1,
                            text = d.message,
                            type = d.severity == vim.diagnostic.severity.ERROR and "E"
                                or d.severity == vim.diagnostic.severity.WARN and "W"
                                or d.severity == vim.diagnostic.severity.INFO and "I"
                                or "H",
                        })
                    end
                    vim.fn.setqflist(items)
                    vim.cmd("Trouble qflist toggle")
                end,
                desc = "Qflist diagnostics",
            },
        },
    },
}
