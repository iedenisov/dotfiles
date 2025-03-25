local home = os.getenv('HOME')

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
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
        '-jar', vim.fn.glob(home ..'/jdtls145plugins/org.eclipse.equinox.launcher_*.jar'),
        "-configuration", home .. "/jdtls145config_linux",
        "-data", workspace_folder,
    },
    root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", "pom.xml"}),
    settings = {
        java = {
            signatureHelp = {
                enabled = true,
            },
            import = {
                maven = {
                    enabled = true,
                },
            },
            -- contentProvider = { preferred = "fernflower" },
            -- completion = {
            --     signatureHelp = { enabled = true },
            --     inlayHints = { enabled = true },
            --     favoriteStaticMembers = {
            --         -- 'com.sun.*',
            --         -- 'io.micrometer.shaded.*',
            --         -- 'jakarta.*',
            --         -- 'java.awt.*',
            --         -- 'jdk.*',
            --         -- 'sun.*',
            --         -- 'org.springframework.*',
            --         -- 'org.mockito.Mockito.*',
            --         -- 'lombok.*',
            --         -- 'import com.atlassian.*',
            --     },
            --     -- filteredTypes = {
            --     --     'com.sun.*',
            --     --     'io.micrometer.shaded.*',
            --     --     'jakarta.*',
            --     --     'java.awt.*',
            --     --     'jdk.*',
            --     --     'sun.*',
            --     --     'org.springframework.*',
            --     --     'lombok.*',
            --     --     'import com.atlassian.*',
            --     -- }
            -- },
            -- eclipse = {
            --     downloadSources = true,
            -- },
            -- maven = {
            --     downloadSources = true,
            -- },
        }
    }
}

require('jdtls').start_or_attach(config)
