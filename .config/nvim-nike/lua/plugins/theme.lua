-- List of themes to install
local themes = {
  "markvincze/panda-vim",
  "olimorris/onedarkpro.nvim",
  "catppuccin/nvim",
  "folke/tokyonight.nvim",
  "deparr/tairiki.nvim",
  "chriskempson/tomorrow-theme",
  "blazkowolf/gruber-darker.nvim",
  "vague-theme/vague.nvim",
  "omacom-io/lumon.nvim",
}

-- Set your preferred colorscheme here
local selected_colorscheme = "vague"

-- Convert theme list to lazy.nvim format
local plugins = {}
for i, theme in ipairs(themes) do
  if i == 1 then
    -- First theme carries the config
    table.insert(plugins, {
      theme,
      lazy = false,
      priority = 1000,
      config = function()
        -- Set the colorscheme
        vim.cmd.colorscheme(selected_colorscheme)

        -- Keybinding to open theme picker
        vim.keymap.set("n", "<leader>fT", function()
          require("snacks").picker.colorschemes()
        end, { desc = "theme picker" })
      end,
    })
  else
    table.insert(plugins, {
      theme,
      lazy = true,
    })
  end
end

return plugins
