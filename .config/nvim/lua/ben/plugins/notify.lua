return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      -- needed if the bg is transparent
      -- background_colour = "#000000",
    })
  end,
}
