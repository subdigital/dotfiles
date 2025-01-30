return {
  "Wansmer/treesj",
  keys = { "<c-m>", "<c-j>" },
  config = function()
    local lang_utils = require("treesj.langs.utils")

    -- wip swift configuration (based on kotlin)
    local swift_config = {
      collection_literal = lang_utils.set_default_preset({
        both = {
          separator = ",",
        },
      }),
      value_arguments = lang_utils.set_default_preset({
        both = {
          separator = ",",
        },
      }),
      statements = lang_utils.set_preset_for_non_bracket({
        split = {
          recursive_ignore = {
            "value_arguments",
            "function_value_parameters",
          },
        },
        join = {
          force_insert = ";",
          no_insert_if = {
            lang_utils.helpers.if_penultimate,
          },
        },
      }),
      lambda_literal = {
        target_nodes = {
          "statements",
        },
      },
      function_body = {
        target_nodes = { "statements" },
      },
      property_declaration = {
        target_nodes = {
          "collection_literal",
          "value_arguments",
        },
      },
      function_value_parameters = lang_utils.set_preset_for_args(),
    }

    require("treesj").setup({
      langs = {
        swift = swift_config,
      },
      max_join_length = 240,
    })

    vim.keymap.set("n", "<c-m>", require("treesj").toggle)
    vim.keymap.set("n", "<c-,>", function()
      require("treesj").toggle({ split = { recursive = true } })
    end)
  end,
}
