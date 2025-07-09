return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                'cssls',
                'html',
                'lua_ls',
                'pyright',
                'ts_ls',
                'markdown_oxide',
            },
            automatic_installation = true,
        })
    end,
}
