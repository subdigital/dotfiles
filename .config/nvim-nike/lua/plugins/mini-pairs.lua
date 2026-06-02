return {
    "nvim-mini/mini.pairs", version = "*",
    config = function()
        require("mini.pairs").setup({
            modes = { command = true }
        })
    end
}
