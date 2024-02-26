local km = vim.keymap

km.set("n", "<leader>zt", "<cmd>TermExec terminal=1 cmd='zig test %'<cr>", { silent = true })
