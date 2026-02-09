return {
  "stevearc/overseer.nvim",
  config = function()
    require("overseer").setup({
      task_list = {
        direction = "right",
        -- 200px or 20%, whichever is less
        max_width = { 200, 0.2 },
      }
    })

    vim.api.nvim_set_keymap("n", "<leader>or", ":OverseerRun<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ot", ":OverseerToggle<cr>", { noremap = true, silent = true })
  end
}
