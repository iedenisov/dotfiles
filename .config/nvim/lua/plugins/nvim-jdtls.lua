return {
    'neovim/nvim-lspconfig',
    dependencies = { "mfussenegger/nvim-jdtls" },
    opts = {
        setup = {
            jdtls = function(_, opts)
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = "java",
                    callback = function()
                        local workspace_dir = "/home/ivdenisov/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
                        local config = {
                            -- capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
                            capabilities = {
                                workspace = {
                                    configuration = true
                                },
                                textDocument = {
                                    completion = {
                                        completionItem = {
                                            snippetSupport = true
                                        }
                                    }
                                }
                            },
                            cmd = {
                                "/home/ivdenisov/.jbang/cache/jdks/21/bin/java",
                                '-javaagent:/home/ivdenisov/.local/share/eclipse/lombok.jar',
                                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                                "-Dosgi.bundles.defaultStartLevel=4",
                                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                                "-Dlog.protocol=true",
                                "-Dlog.level=ALL",
                                "-Xms1g",
                                "--add-modules=ALL-SYSTEM",
                                "--add-opens", "java.base/java.util=ALL-UNNAMED",
                                "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                                '-jar', vim.fn.glob('/home/ivdenisov/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
                                "-configuration", "/home/ivdenisov/jdtls/config_linux",
                                "-data", workspace_dir,
                            },

                            -- This is the default if not provided, you can remove it. Or adjust as needed.
                            -- One dedicated LSP server & client will be started per unique root_dir
                            root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

                            -- Here you can configure eclipse.jdt.ls specific settings
                            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                            -- for a list of options
                            settings = {
                                java = {
                                    extendedClientCapabilities = {
                                        resolveAdditionalTextEditsSupport = true
                                    },
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
                                    },
                                    codeGeneration = {
                                        toString = {
                                            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                                        },
                                        useBlocks = true,
                                    },
                                    eclipse {
                                        downloadSources = true
                                    },
                                    maven {
                                        downloadSources = true
                                    },
                                    configuration = {
                                        -- runtimes = {
                                        --     {
                                        --         name = "JavaSE-1.8",
                                        --         path = "/home/ivdenisov/.jbang/cache/jdks/8"
                                        --     },
                                        --     {
                                        --         name = "JavaSE-11",
                                        --         path = "/home/ivdenisov/.jbang/cache/jdks/11"
                                        --     },
                                        --     {
                                        --         name = "JavaSE-17",
                                        --         path = "/home/ivdenisov/.jbang/cache/jdks/17"
                                        --     },
                                        --     {
                                        --         name = "JavaSE-21",
                                        --         path = "/home/ivdenisov/.jbang/cache/jdks/21"
                                        --     },
                                        -- }
                                    }
                                },
                            },
                            handlers = {
                                ["language/status"] = function(_, result)
                                    -- print(result)
                                end,
                                ["$/progress"] = function(_, result, ctx)
                                    -- disable progress updates.
                                end,
                            },
                        }
                        require("jdtls").start_or_attach(config)
                    end,
                })
                return true
            end,
        }
    }
}
