return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local home = os.getenv('HOME')
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
        -- lspconfig.jdtls.setup{
            -- cmd = {
            --     home .. "/.jbang/cache/jdks/21/bin/java",
            --     "-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",
            --     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            --     "-Dosgi.bundles.defaultStartLevel=4",
            --     "-Declipse.product=org.eclipse.jdt.ls.core.product",
            --     "-Dlog.protocol=true",
            --     "-Dlog.level=ALL",
            --     "-Xms1g",
            --     "--add-modules=ALL-SYSTEM",
            --     "--add-opens", "java.base/java.util=ALL-UNNAMED",
            --     "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            --     '-jar', vim.fn.glob(home ..'/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
            --     "-configuration", home .. "/jdtls/config_linux",
            --     "-data", workspace_dir,
            -- },

            -- settings = {
            --     java = {
            --         extendedClientCapabilities = {
            --             resolveAdditionalTextEditsSupport = true
            --         },
            --         contentProvider = { preferred = "fernflower" },
            --         references = {
            --             includeDecompiledSources = true,
            --         },
            --         sources = {
            --             organizeImports = {
            --                 starThreshold = 9999,
            --                 staticStarThreshold = 9999,
            --             },
            --         },
            --         completion = {
            --             signatureHelp = { enabled = true },
            --             favoriteStaticMembers = {
            --                 "org.springframework.*",
            --             },
            --             codeGeneration = {
            --                 toString = {
            --                     template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            --                 },
            --                 useBlocks = true,
            --             },
            --             -- eclipse {
            --             --     downloadSources = true
            --             -- },
            --             -- maven {
            --             --     downloadSources = true
            --             -- },
            --             configuration = {
            --                 -- runtimes = {
            --                 --     {
            --                 --         name = "JavaSE-1.8",
            --                 --         path = "/home/ivdenisov/.jbang/cache/jdks/8"
            --                 --     },
            --                 --     {
            --                 --         name = "JavaSE-11",
            --                 --         path = "/home/ivdenisov/.jbang/cache/jdks/11"
            --                 --     },
            --                 --     {
            --                 --         name = "JavaSE-17",
            --                 --         path = "/home/ivdenisov/.jbang/cache/jdks/17"
            --                 --     },
            --                 --     {
            --                 --         name = "JavaSE-21",
            --                 --         path = "/home/ivdenisov/.jbang/cache/jdks/21"
            --                 --     },
            --                 -- }
            --             }
            --         },
            --     },
            -- },
        -- }
        lspconfig.lua_ls.setup{}
        lspconfig.pyright.setup{}
        lspconfig.markdown_oxide.setup{}
        lspconfig.ts_ls.setup{}
        lspconfig.volar.setup{}
    end,
}
