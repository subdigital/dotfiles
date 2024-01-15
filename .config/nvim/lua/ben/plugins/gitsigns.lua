return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({"n", "v"}, "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk")
        map({"n", "v"}, "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk")
        map("n", "<leader>gad", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>gres", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>ghb", function() gs.blame_line({full = true}) end, "Blame line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({"o", "x"}, "ih", "<cmd><c-U>Gitsigns select_hunk<cr>", "Gitsigns select hunk")
      end
    })
  end
}
