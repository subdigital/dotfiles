return {
    "numToStr/Comment.nvim",
    event = { "BufEnter" },
    config = function()
      require('Comment').setup()
    end
}
