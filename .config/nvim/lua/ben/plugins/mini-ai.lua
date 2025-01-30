return {
  "echasnovski/mini.ai",
  dependencies = {
  },
  config = function()
    local ai = require("mini.ai")
    ai.setup({
      custom_textobjects = {
        s = { '%[%[().-()%]%]' },
        F = ai.gen_spec.treesitter({
          a = '@function.outer', i = '@function.inner'
        })
      }
    })
  end,
}

