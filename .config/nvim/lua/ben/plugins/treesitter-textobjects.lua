return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    local config = require("nvim-treesitter.configs")
    local opts = {
      textobjects = {
        select = {
          enable = true,
          -- if you're not _in the textobject it will look for the next one
          lookahead = true,
          inclue_surrounding_whitespace = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["if"] = { query = "@function.inner", desc = "Select inside function" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>]"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>["] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          -- whether to set jumps in the jumplist
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "Next function start" },
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            -- ["]s"] = { query = "@local.scope", query_group = "local", desc = "Next scope start" },
            -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "Next function end" },
          },
          goto_prev_start = {
            ["[m"] = { query = "@function.outer", desc = "Next function start" },
            ["[["] = { query = "@class.outer", desc = "Next class start" },
            -- ["]s"] = { query = "@local.scope", query_group = "local", desc = "Next scope start" },
            -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
        },
      },
    }
    config.setup(opts)
  end,
}
