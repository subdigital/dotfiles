nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>

lua << EOS
  local actions = require('telescope.actions')
  require('telescope').setup{
    defaults = {
      mappings = {
        n = {
          ["<c-q>"] = actions.send_selected_to_qflist
        }
      },

      -- default configuration for telescope goes here
      file_ignore_patterns = {
        "node_modules"
      },
      pickers = {},
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- more opts
          }
        }
      }
    }
  }

  -- for fzf integration
  require("telescope").load_extension("ui-select")
EOS

