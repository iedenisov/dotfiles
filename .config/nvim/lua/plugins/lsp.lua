return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lspconfig = require('lspconfig')
        -- lspconfig.lua_ls.setup{
        --     settings = {
        --         Lua = {
        --             hint = {
        --                 enable = true,
        --             },
        --         },
        --         runtime = {
        --             version = 'LuaJIT',
        --         },
        --         workspace = {
        --             checkThisParty = true,
        --             library = {
        --                 vim.env.VIMRUNTIME,
        --                 '~/.local/share/nvim/lazy/solarized.nvim',
        --             },
        --         },
        --     },
        -- }

        lspconfig.cssls.setup{}
        lspconfig.html.setup{}
        lspconfig.jdtls.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.pyright.setup{}
        lspconfig.markdown_oxide.setup{}
        lspconfig.ts_ls.setup{}
        lspconfig.volar.setup{}
    end,
}
