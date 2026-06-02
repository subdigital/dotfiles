return {
    {
        -- floating code actions
        -- see lsp setup for how this gets activated
        "Chaitanyabsprip/fastaction.nvim",
        event = "LspAttach",
        opts = {
            keys = "fjdkslaghrueiwoncmv",
            dismiss_keys = { "j", "k", "<c-c>", "q" },
            register_ui_select = false,
        },
    },
}
