return {
    "folke/todo-comments.nvim",
    events = {"BufReadPost", "BufNewFile"},
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup({})

        vim.keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, { desc = "next todo comment"})

        vim.keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, { desc = "previous todo comment"})
    end
}
