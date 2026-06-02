return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        local colors = {
            -- Base colors
            bg_dark      = "#092236",   -- Dark background for highlights
            bg           = "#1c1e26",   -- Main background
            fg           = "#c3ccdc",   -- Primary foreground text
            fg_dim       = "#a1aab8",   -- Dimmed/inactive text
            fg_muted     = "#828697",   -- Subdued text

            -- Accent colors
            red          = "#ff5874",   -- Replace mode, errors
            purple       = "#ae81ff",   -- Visual mode
            cyan         = "#c3ccdc",   -- Insert mode (using fg)
        }

        local my_lualine_theme = {
            normal = {
                a = { fg = colors.bg_dark, bg = colors.fg_muted,  gui = "bold" },
                b = { fg = colors.fg,      bg = colors.bg },
                c = { fg = colors.fg,      bg = colors.bg },
            },
            insert = {
                a = { fg = colors.bg_dark, bg = colors.fg,       gui = "bold" },
                b = { fg = colors.fg,      bg = colors.bg },
            },
            visual = {
                a = { fg = colors.bg_dark, bg = colors.purple,   gui = "bold" },
                b = { fg = colors.fg,      bg = colors.bg },
            },
            replace = {
                a = { fg = colors.bg_dark, bg = colors.red,      gui = "bold" },
                b = { fg = colors.fg,      bg = colors.bg },
            },
            inactive = {
                a = { fg = colors.fg_dim,  bg = colors.bg,       gui = "bold" },
                b = { fg = colors.fg_dim,  bg = colors.bg },
                c = { fg = colors.fg_dim,  bg = colors.bg },
            },
        }

        local mode = {
            "mode",
            fmt = function(str)
                return " " .. str
            end
        }
        -- since we're showing the status here, we don't need it in standard vim
        vim.opt.showmode = false

        local diff = {
            "diff",
            colored = true,
            symbols = {
                added = "⊕",
                modified = "⊙",
                removed = "⊖"
            }
        }

        local filename = {
            "file",
            file_status = true,
            path = 0
        }

        local branch = {
            "branch",
            icon = {
                "",
                color = { fg = "#a6d4de" }
            },
            "|"
        }

        lualine.setup({
            icons_enabled = true,
            options = {
                theme = 'horizon',
            },
            -- sections = {
            --     lualine_a = {'mode'},
            --     lualine_b = {'branch', 'diff', 'diagnostics'},
            --     lualine_c = {'filename'},
            --     lualine_x = {'filetype'},
            --     lualine_z = {'location'}
            -- },
        })
    end
}
