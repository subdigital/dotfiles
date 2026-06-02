return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = 'Live Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'Help Tags' },
        { '<leader>fr', '<cmd>Telescope oldfiles<cr>',   desc = 'Recent Files' },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({})
        telescope.load_extension('fzf')
    end,
}
