--  Check if a file path contains any hidden (dotfile) components
local function is_in_hidden_path(filepath)
    for component in filepath:gmatch("[^/]+") do
        if component:sub(1, 1) == "." then
            return true
        end
    end
    return false
end

-- Reveals the current file in the explorer, enabling hidden files if needed
local function reveal_current_file()
    local snacks = require("snacks")
    local filepath = vim.fn.expand("%:p")
    local dir = vim.fn.fnamemodify(filepath, ":h")

    if is_in_hidden_path(filepath) then
        -- Open explorer at file's directory with hidden files visible, then reveal
        snacks.explorer.open({ cwd = dir, hidden = true })
        vim.defer_fn(function()
            snacks.explorer.reveal({ file = filepath })
        end, 50)
    else
        snacks.explorer.reveal({ file = filepath })
    end
end

return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            terminal = {},
            -- `:OverseerRun` and anything else that uses `vim.ui.select` get a fuzzy, filterable UI
            picker = {
                enabled = true,
                ui_select = true,
                -- https://github.com/stevearc/overseer.nvim uses this kind in commands.lua
                kinds = {
                    overseer_template = {
                        layout = { preset = "ivy" },
                    },
                },
            },
            explorer = {
                include = "~/.config/*"
            },
            -- Tree-sitter scope for YAML can throw on some files; keep guides, skip TS scope on yaml ft.
            indent = {
                scope = {
                    filter = function(buf)
                        local ft = vim.bo[buf].filetype
                        if ft == "yaml" or vim.startswith(ft, "yaml.") then
                            return false
                        end
                        return vim.bo[buf].buftype == ""
                            and vim.b[buf].snacks_scope ~= false
                            and vim.g.snacks_scope ~= false
                    end,
                },
            },
            dashboard = {
                preset = {
                    header = [[
                    ················································································
                    ················································································
                    ················································································
                    ············;;····················································;;;;;;;·······
                    ··········Φββ·············································φ;;;;ββ;;;············
                    ·········;ββΜ·····································β;;;;ββββΆ;;Ν·················
                    ·······;ββββ·····························;;;;;ββββββββΨ;;Ϊ······················
                    ······;βββββ;····················χ;;;;βββββββββββΨ;;Ϋ···························
                    ·····;ββββββββ;··········β;;;;ββββββββββββββ;;;΅································
                    ·····ββββββββββββββββββββββββββββββββββ;;;······································
                    ····;βββββββββββββββββββββββββββββ;;;···········································
                    ····ΐββββββββββββββββββββββββ;;;················································
                    ·····;ΨββββββββββββββββΨ;;Φ·····················································
                    ·······;;ΨββββββΨ;;;;Ϋ··························································
                    ················································································
                    ················································································
                    ················································································
                    ················································································
                    ]],
                }
            },
            image = {
                doc = {
                    float = false,
                    inline = true, -- to show on cursor hover
                    max_width = 50,
                    max_height = 30,
                    wo = {
                        wrap = true
                    },
                    convert = {
                        notify = true,
                        command = "magick"
                    },
                    img_dirs = {
                        "img", "images", "assets", "~/Desktop", "~/Downloads"
                    }
                }
            },
            notifier = {}
        },
        keys = {
            { "<a-c>",      "toggle_cwd",                                   desc = "Lazygit" },
            { "<leader>g",  function() require("snacks").lazygit() end,     desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit logs" },
            {
                "<leader>e",
                function()
                    local filepath = vim.fn.expand("%:p")
                    local config_dir = vim.fn.stdpath("config")

                    -- Check if file is in neovim config directory
                    if filepath:find(config_dir, 1, true) == 1 then
                        require("snacks").explorer({ cwd = config_dir })
                        return
                    end

                    -- Check if we're in a git repo
                    local git_root = vim.fn.systemlist("git -C " ..
                        vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel 2>/dev/null")[1]

                    if filepath ~= "" and (vim.v.shell_error ~= 0 or git_root == nil or git_root == "") then
                        -- Not in a git repo, open explorer at current file's directory
                        local dir = vim.fn.fnamemodify(filepath, ":h")
                        require("snacks").explorer({ cwd = dir })
                    else
                        -- In a git repo or no file, use default behavior
                        require("snacks").explorer()
                    end
                end,
                desc = "explore files"
            },
            {
                "<D-e>",
                function()
                    local filepath = vim.fn.expand("%:p")
                    local config_dir = vim.fn.stdpath("config")

                    -- Check if file is in neovim config directory
                    if filepath:find(config_dir, 1, true) == 1 then
                        require("snacks").explorer({ cwd = config_dir })
                        return
                    end

                    -- Check if we're in a git repo
                    local git_root = vim.fn.systemlist("git -C " ..
                        vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel 2>/dev/null")[1]

                    if filepath ~= "" and (vim.v.shell_error ~= 0 or git_root == nil or git_root == "") then
                        -- Not in a git repo, open explorer at current file's directory
                        local dir = vim.fn.fnamemodify(filepath, ":h")
                        require("snacks").explorer({ cwd = dir })
                    else
                        -- In a git repo or no file, use default behavior
                        require("snacks").explorer()
                    end
                end,
                desc = "explore files"
            },
            { "<D-E>",      reveal_current_file,                                   desc = "reveal current file in explorer" },

            -- picker
            { "<leader>fp", function() require("snacks").picker() end,             desc = "file picker" },
            { "<D-P>",      function() require("snacks").picker() end,             desc = "file picker" },
            { "<leader>fb", function() require("snacks").picker.buffers() end,     desc = "buffer picker" },
            { "<D-p>",      function() require("snacks").picker.files() end,       desc = "file picker" },
            { "<leader>ff", function() require("snacks").picker.files() end,       desc = "file picker" },
            { "<leader>fr", function() require("snacks").picker.recent() end,      desc = "recent file picker" },
            { "<leader>fh", function() require("snacks").picker.help() end,        desc = "help picker" },
            { "<leader>fd", function() require("snacks").picker.diagnostics() end, desc = "diagnostics picker" },
            {
                "<leader>fw",
                function()
                    require("snacks").picker.grep_word()
                end,
                desc = "grep visual selection or word",
                mode = { "n", "x" }
            },
            { "<leader>fg", function() require("snacks").picker.grep() end, desc = "grep word" },
            {
                "<leader>fc",
                function()
                    require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = "config file picker"
            },
            -- terminal
            {
                "<c-\\>",
                function()
                    require("snacks").terminal()
                end,
                desc = "terminal",
                mode = { "n", "t" }
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        events = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>fkm", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "search keymaps" },
            { "<leader>ft",  function() require("snacks").picker.todo_comments() end,             desc = "todo comments" },
        }
    }
}
