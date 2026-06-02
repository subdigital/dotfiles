return {
    "hrsh7th/nvim-cmp",
    enabled = false, -- for reference, may switch back
    dependencies = {
        "hrsh7th/cmp-buffer", -- completions from the current buffer
        "hrsh7th/cmp-path", -- completions from the file system
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = cmp.config.sources({
                { name = "buffer" },
                { name = "path" },
            })
        })
    end
}
