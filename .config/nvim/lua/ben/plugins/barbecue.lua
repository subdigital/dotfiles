-- provides a vscode-like navigation bar at the top
-- seems to be no longer maintained
return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  enabled = false,
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  -- disabled to check the E36: Not enough room error
  enabled = false,
}
