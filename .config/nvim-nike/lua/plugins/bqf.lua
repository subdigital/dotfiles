-- better quickfix
return {
    {
        "kevinhwang91/nvim-bqf",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("bqf").setup({
                func_map = {
                    split = "<localleader>s",
                    tabb = "",
                    tabc = "",
                    vsplit = "<localleader>v",
                },
                preview = {
                    winblend = 0,
                    auto_preview = false,
                },
                show_title = {
                    default = false,
                },
                filter = {
                    fzf = {
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
                    },
                },
            })
        end,
    },
    {
        "yorickpeterse/nvim-pqf",
        event = "VeryLazy",
        opts = {},
    },
}
