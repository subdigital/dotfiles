return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    icons = {
      info = " ",
      warn = " ",
      error = " ",
      hint = " ",
    },
    picker = { enabled = true }
  },
  keys = {
    { "<D-p>",      function() Snacks.picker.smart() end,        desc = "Smart find files" },
    { "<D-P>",      function() Snacks.picker.pick() end,         desc = "Snacks picker" },
    { "<D-F>",      function() Snacks.picker.grep() end,         desc = "Grep in project" },
    { "<leader>gw", function() Snacks.picker.grep_word() end,    desc = "Grep word in project" },
    { "<leader>fp", function() Snacks.picker.projects() end,     desc = "Find Projects" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  }
}
