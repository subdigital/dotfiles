-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end


-- this should be zero if we want the titlebar to share the alpha as well
-- vim.g.neovide_transpjrency = 0.0
-- vim.g.transparency = 0.9
-- vim.g.neovide_background_color = "#0f1117" .. alpha()

-- hide the mouse when typing
vim.g.neovide_hide_mouse_when_typing = true

-- remember prev window size
vim.g.neovide_remember_window_size = true

-- macOS cmd key binds
vim.keymap.set("n", "<D-s>", ":w<cr>")
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("n", "<D-v>", '"+P')
vim.keymap.set("v", "<D-v>", '"+P')
vim.keymap.set("c", "<D-v>", "<c-R>+") -- paste in command mode
vim.keymap.set("i", "<D-v>", '<esc>l"+Pli') -- paste in insert mode

