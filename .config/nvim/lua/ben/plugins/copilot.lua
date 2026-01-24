return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    "zbirenbaum/copilot.lua"
  },
  enabled = false,
  cond = function()
    local hostname = vim.fn.hostname()
    local hosts = {
      artemis = false
    }

    for host, enabled in pairs(hosts) do
      if hostname == host then
        return enabled
      end
    end

    return true
  end,
  event = { "BufEnter" },
  config = function()
    require("copilot").setup({})

    require("copilot_cmp").setup({
      suggestion = { enabled = true },
      panel = { enabled = true }, -- false will disable the suggestion popup
    })
  end,
}
