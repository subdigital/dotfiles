return {
    "azorng/goose.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MeanderingProgrammer/render-markdown.nvim"
    },
    config = function()
        require("goose").setup({
            prefered_picker = "snacks", -- typo intentional here
            default_global_keymaps = false,
            keymap = {
                global = {
                    toggle = "<D-g>",
                    toggle_fullscreen = "<leader>af",
                    goose_mode_auto = "<leader>ama",
                    goose_mode_chat = "<leader>amc",
                    goose_open_oputput = "<leader>ao"
                },
            },
        })
    end
}
