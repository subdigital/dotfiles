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
  "blazkowolf/gruber-darker.nvim",
  "rktjmp/lush.nvim",
  "craftzdog/solarized-osaka.nvim",
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
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = false } },
  "uloco/bluloco.nvim",
  "LuRsT/austere.vim",
  "ricardoraposo/gruvbox-minor.nvim",
  "NTBBloodbath/sweetie.nvim",
  {
    "maxmx03/fluoromachine.nvim",
  },
  "adibhanna/yukinord.nvim"
}

-- Set your preferred colorscheme here
local selected_colorscheme = "sweetie"

-- Convert theme list to lazy.nvim format
local plugins = {}
for i, theme in ipairs(themes) do
  local entry = type(theme) == "string" and { theme } or vim.deepcopy(theme)

  if i == 1 then
    -- First theme carries the config
    entry.lazy = false
    entry.priority = 1000
    entry.config = function()
      -- Set the colorscheme
      vim.cmd.colorscheme(selected_colorscheme)

      -- Keybinding to open theme picker
      vim.keymap.set("n", "<leader>fT", function()
        require("snacks").picker.colorschemes()
      end, { desc = "theme picker" })
    end
  else
    entry.lazy = true
  end

  table.insert(plugins, entry)
end

return plugins
