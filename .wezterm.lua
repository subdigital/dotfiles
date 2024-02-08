local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Batman"
-- config.color_scheme = "Tango (base16)"
config.color_scheme = "Thayer Bright"
config.font = wezterm.font "Iosevka Nerd Font"
config.font_size = 18
config.line_height = 1.1

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- keybinds
config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback('ScrollbackAndViewport')
  },

  -- pane splits
  {
    key = 'd',
    mods = 'CMD',
    action = act.SplitPane({ direction = 'Right' })
  },

  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = act.SplitPane({ direction = 'Down' })
  },


  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane({confirm = true})
  },

  -- pane select
  {
    key = '8',
    mods = 'CTRL',
    action = act.PaneSelect
  },

  -- Make Option-Left/Right equivalent to Alt-b/f which many line editors interpret as backward-word or forward word
  {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action{ SendString="\x1bb" }
  },
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action{ SendString="\x1bf" }
  }
}

return config

