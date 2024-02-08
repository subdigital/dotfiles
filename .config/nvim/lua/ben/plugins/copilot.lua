return {
  "zbirenbaum/copilot-cmp",
  enabled = true,
  event = { "BufEnter" },
  config = function()
    require("copilot_cmp").setup({
      suggestion = { enabled = true },
      panel = { enabled = true }, -- false will disable the suggestion popu
    })
  end,
}
