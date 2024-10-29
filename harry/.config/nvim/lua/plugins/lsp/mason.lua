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
                'ts_ls',
                'html',
                'cssls',
                'lua_ls',
                'apex_ls',
                'pyright',
                'jdtls'
            },
            automatic_installation = true,
        })
    end,
}
