return {
    "nvim-mini/mini.trailspace",
    event = "VimEnter",
    config = function()
        -- TODO: this plugin is rather greedy and highlights buffers we don't really want
        -- this is a hack to avoid it in some cases, but maybe we don't need this?
        local mini_trailspace = require("mini.trailspace")
        mini_trailspace.setup({})

        -- Filetypes and buftypes to ignore
        local ignore_filetypes = {
            "snacks_dashboard",
            "dashboard",
            "lazy",
            "mason",
            "help",
            "neo-tree",
            "TelescopePrompt",
            "toggleterm",
        }

        local ignore_buftypes = {
            "nofile",
            "terminal",
            "prompt",
            "quickfix",
        }

        -- Function to check if trailspace should be disabled
        local function should_disable()
            local ft = vim.bo.filetype
            local bt = vim.bo.buftype

            for _, v in ipairs(ignore_filetypes) do
                if ft == v then return true end
            end

            for _, v in ipairs(ignore_buftypes) do
                if bt == v then return true end
            end

            return false
        end

        -- Function to disable and unhighlight if needed
        local function check_and_disable()
            if should_disable() then
                vim.b.minitrailspace_disable = true
                mini_trailspace.unhighlight()
            end
        end

        -- Immediately check the current buffer (for dashboard on startup)
        vim.schedule(check_and_disable)

        -- Use BufEnter and FileType to catch buffers after their type is set
        vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
            callback = check_and_disable,
        })

        vim.keymap.set("n", "<leader>cw",
            function()
                mini_trailspace.trim()
            end,
            { desc = "clear trailing whitespace" }
        )
    end,
}
