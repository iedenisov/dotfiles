return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep',
        'sharkdp/fd'
    },
    config = function()
        local telescope = require('telescope')

        telescope.setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })
    end,
}
