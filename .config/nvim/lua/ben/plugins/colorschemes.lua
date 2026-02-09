-- -- Change this variable to switch themes
-- local active_theme = "base16-custom"


-- ... this file is filled with pain

return {
    {
        lazy = false,
        priority = 1000,
        "folke/tokyonight.nvim",
        config = function(opts)
            -- hijack this plugin's config function to set the desired theme
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    "rktjmp/lush.nvim",
    "craftzdog/solarized-osaka.nvim",
    { "rose-pine/neovim", name = "rose-pine" },
    "eldritch-theme/eldritch.nvim",
    "jesseleite/nvim-noirbuddy",
    "miikanissi/modus-themes.nvim",
    "rebelot/kanagawa.nvim",
    "rockyzhang24/arctic.nvim",
    "Shatur/neovim-ayu",
    "RRethy/base16-nvim",
    "xero/miasma.nvim",
    "cocopon/iceberg.vim",
    "kepano/flexoki-neovim",
    "ntk148v/komau.vim",
    { "catppuccin/nvim",  name = "catppuccin", opts = { transparent_background = false } },
    "uloco/bluloco.nvim",
    "LuRsT/austere.vim",
    "ricardoraposo/gruvbox-minor.nvim",
    "NTBBloodbath/sweetie.nvim",
    { "rose-pine/neovim", name = "rose-pine" },
    {
        "maxmx03/fluoromachine.nvim",
        -- config = function()
        --   local fm = require "fluoromachine"
        --   fm.setup { glow = true, theme = "fluoromachine" }
        -- end,
    },
}

-- Theme definitions: plugin spec + colorscheme command
-- local themes = {
--   ["kanagawa"] = {
--     plugin = "rebelot/kanagawa.nvim",
--     colorscheme = "kanagawa",
--     setup = function()
--       require("kanagawa").setup({
--         compile = true,
--         transparent = true,
--         theme = "dragon",
--       })
--     end,
--     build = function()
--       vim.cmd("KanagawaCompile")
--     end,
--   },
--   ["tokyonight"] = {
--     plugin = "folke/tokyonight.nvim",
--     colorscheme = "tokyonight",
--   },
--   ["nightfly"] = {
--     plugin = "bluz71/vim-nightfly-colors",
--     colorscheme = "nightfly",
--   },
--   ["moonfly"] = {
--     plugin = "bluz71/vim-moonfly-colors",
--     colorscheme = "moonfly",
--   },
--   ["catppuccin-mocha"] = {
--     plugin = "catppuccin/nvim",
--     name = "catppuccin",
--     colorscheme = "catppuccin-mocha",
--   },
--   ["catppuccin-latte"] = {
--     plugin = "catppuccin/nvim",
--     name = "catppuccin",
--     colorscheme = "catppuccin-latte",
--   },
--   ["catppuccin-frappe"] = {
--     plugin = "catppuccin/nvim",
--     name = "catppuccin",
--     colorscheme = "catppuccin-frappe",
--   },
--   ["catppuccin-macchiato"] = {
--     plugin = "catppuccin/nvim",
--     name = "catppuccin",
--     colorscheme = "catppuccin-macchiato",
--   },
--   ["xcode"] = {
--     plugin = "lunacookies/vim-colors-xcode",
--     colorscheme = "xcode",
--   },
--   ["base16-custom"] = {
--     plugin = "https://github.com/RRethy/base16-nvim",
--     colorscheme = "base16-custom",
--     setup = function()
--       local bg = "#0F1919"
--       local accent = "#102121"
--       local accent2 = "#0D2525" -- highlight
--
--       local text = "#abb2bf"
--       local dark_text = "#3E4451" -- comments, line numbers
--
--       local keyword = "#8F939A"
--       local func = "#B6AB8B"
--       local types = "#65838E"
--       local constant = "#A06057"
--
--       local for_testing = "#FF0000"
--
--       require("base16-colorscheme").setup({
--         base00 = bg,
--         base01 = accent,
--         base02 = accent2,
--         base03 = dark_text,
--         base04 = dark_text,
--         base05 = text,
--         base06 = for_testing,
--         base07 = for_testing,
--         base08 = text,
--         base09 = constant,
--         base0A = types,
--         base0B = constant,
--         base0C = text,
--         base0D = func,
--         base0E = keyword,
--         base0F = text,
--       })
--     end,
--   },
-- }
--
-- -- Build the plugin specs from the themes table
-- local function build_plugin_specs()
--   local specs = {}
--   local seen_plugins = {}
--
--   for theme_name, theme in pairs(themes) do
--     local plugin_key = theme.plugin .. (theme.name or "")
--
--     if not seen_plugins[plugin_key] then
--       seen_plugins[plugin_key] = true
--
--       local is_active = theme_name == active_theme
--       local spec = {
--         theme.plugin,
--         name = theme.name,
--         lazy = not is_active,
--         priority = is_active and 1000 or nil,
--         config = function()
--           if theme.setup then
--             theme.setup()
--           end
--           if is_active then
--             if theme.colorscheme == "base16-custom" then
--               -- base16-colorscheme.setup already applies the theme
--             else
--               vim.cmd("colorscheme " .. theme.colorscheme)
--             end
--           end
--         end,
--         build = theme.build,
--       }
--       table.insert(specs, spec)
--     end
--   end
--
--   -- Add transparent.nvim (utility plugin, not a theme)
--   table.insert(specs, {
--     "xiyaowong/transparent.nvim",
--     lazy = false,
--     enabled = false,
--     priority = 1000,
--     config = function()
--       require("transparent").setup({
--         exclude_groups = { "NotifyBackground" },
--       })
--     end,
--   })
--
--   return specs
-- end
--
-- return build_plugin_specs()
