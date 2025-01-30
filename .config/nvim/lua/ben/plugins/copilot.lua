return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    "zbirenbaum/copilot.lua"
  },
  enabled = true,
  event = { "BufEnter" },
  config = function()
    require("copilot").setup({})

    require("copilot_cmp").setup({
      suggestion = { enabled = true },
      panel = { enabled = true }, -- false will disable the suggestion popu
    })
  end,
}
