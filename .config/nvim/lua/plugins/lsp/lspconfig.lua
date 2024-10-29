return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lspconfig = require('lspconfig')

        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
        lspconfig.apex_ls.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.pyright.setup{}
        lspconfig.ts_ls.setup{}
        lspconfig.volar.setup{}
        lspconfig.jdtls.setup{}
    end,
}
