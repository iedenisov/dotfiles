local home = os.getenv('HOME')
local jdtls = require("jdtls")
local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    extendedClientCapabilities = extendedClientCapabilities,
    cmd = {
        home .. "/.jbang/cache/jdks/21/bin/java",
        "-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        '-jar', vim.fn.glob(home ..'/jdtls145/plugins/org.eclipse.equinox.launcher_*.jar'),
        "-configuration", home .. "/jdtls145/config_linux",
        "-data", workspace_dir,
    },
    root_dir = root_dir,
    settings = {
        java = {
            signatureHelp = {
                enabled = true,
                description = {
                    enabled = true
                }
            },
            contentProvider = { preferred = "fernflower" },
            import = {
                maven = {
                    enabled = true,
                },
            },
            inlayhints = {
                parameterNames = {
                    enabled = "all",
                },
            },
            eclipse = {
                downloadSources = true
            },
            jdt = {
                ls = {
                    lombokSupport = {
                        enabled = true
                    }
                }
            },
            maven = {
                downloadSources = true
            },
            references = {
                includeDecompiledSources = true
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            completion = {
                favoriteStaticMembers = {
                    -- "org.springframework.*",
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    useBlocks = true,
                },
            },
            configuration = {
                maven = {
                    globalSettings = "/usr/share/atlassian-plugin-sdk-8.2.8/apache-maven-3.5.4/conf/settings.xml"
                },
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
            },
            project = {
                referencedLibraries = {
                    include = home .. "/.m2/repository/**/*.jar"
                },
            },
        },
    },
}

require("jdtls").start_or_attach(config)
