return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      shading_factor = 2
    },
    init = function()
      -- create a table of dirs to cycle through when we press a button
      local dirs = { "horizontal", "vertical", "float" }
      local dir_index = 0
      local cycle = function()
        dir_index = math.fmod(dir_index + 1, #dirs)
        local size
        local dir = dirs[dir_index + 1]
        if dir == "horizontal" then
          size = 25
        elseif dir == "vertical" then
          size = 80
        else
          size = 20
        end

        vim.cmd("ToggleTerm direction=" .. dirs[dir_index + 1] .. " size=" .. size)
      end
      -- ctrl pipe to cycle through the different term layouts
      vim.keymap.set("n", "<c-|>", cycle, { noremap = true, silent = true })
    end,
  },
}

