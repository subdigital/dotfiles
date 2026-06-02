return {
    "nvim-mini/mini.splitjoin",
    config = function()
        local msj = require("mini.splitjoin")
        msj.setup({
            mappings = {
                toggle = "<c-m>"
            }
        })
    end
}
