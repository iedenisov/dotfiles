local home = os.getenv('HOME')

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
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
        '-jar', vim.fn.glob(home ..'/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        "-configuration", home .. "/jdtls/config_linux",
        "-data", workspace_folder,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
            contentProvider = { preferred = "fernflower" },
            completion = {
                signatureHelp = { enabled = true },
                -- favoriteStaticMembers = {
                --     'com.sun.*',
                --     'io.micrometer.shaded.*',
                --     'jakarta.*',
                --     'java.awt.*',
                --     'jdk.*',
                --     'sun.*',
                --     'org.springframework.*',
                --     'lombok.*',
                --     'import com.atlassian.*',
                -- },
                -- filteredTypes = {
                --     'com.sun.*',
                --     'io.micrometer.shaded.*',
                --     'jakarta.*',
                --     'java.awt.*',
                --     'jdk.*',
                --     'sun.*',
                --     'org.springframework.*',
                --     'lombok.*',
                --     'import com.atlassian.*',
                -- }
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
        }
    }
}
require('jdtls').start_or_attach(config)
