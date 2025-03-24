return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local home = os.getenv('HOME')
        local lspconfig = require('lspconfig')

        -- JDTLS
        local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml'}
        local root_dir = require('jdtls.setup').find_root(root_markers)
        local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

        lspconfig.jdtls.setup{
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
            root_dir = root_dir,
            settings = {
                java = {
                    contentProvider = { preferred = "fernflower" },
                    references = {
                        includeDecompiledSources = true,
                    },
                    sources = {
                        organizeImports = {
                            starThreshold = 9999,
                            staticStarThreshold = 9999,
                        },
                    },
                    completion = {
                        signatureHelp = { enabled = true },
                        favoriteStaticMembers = {
                            "org.springframework.*",
                        },
                        codeGeneration = {
                            toString = {
                                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                            },
                            useBlocks = true,
                        },
                        -- eclipse {
                        --     downloadSources = true
                        -- },
                        -- maven {
                        --     downloadSources = true
                        -- },
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-1.8",
                                    path = home .. "/.jbang/cache/jdks/8"
                                },
                                {
                                    name = "JavaSE-11",
                                    path = home .. "/.jbang/cache/jdks/11"
                                },
                                {
                                    name = "JavaSE-17",
                                    path = home .. "/.jbang/cache/jdks/17"
                                },
                                {
                                    name = "JavaSE-21",
                                    path = home .. "/.jbang/cache/jdks/21"
                                },
                            }
                        }
                    },
                },
            },
        }

        lspconfig.cssls.setup{}
        lspconfig.html.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.pyright.setup{}
        lspconfig.markdown_oxide.setup{}
        lspconfig.ts_ls.setup{}
        lspconfig.volar.setup{}
    end,
}
