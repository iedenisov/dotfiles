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
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    height = 0.99,
                    width = 0.99,
                    preview_width = 0.55
                },
                wrap_results = true,
            },
            pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = true,
                },
                colorscheme = {
                    enable_preview = true
                }
            },
        })
    end,
}
