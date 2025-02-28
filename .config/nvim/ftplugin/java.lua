local home = os.getenv('HOME')

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    cmd = {'/home/ivdenisov/jdtls/bin/jdtls'},
    -- cmd = {
    -- 'java', \
    -- '-jar', vim.fn.glob(home .. 'ecliplse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/'), \
    -- },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
            completion = {
                favoriteStaticMembers = {
                    'com.sun.*',
                    'io.micrometer.shaded.*',
                    'jakarta.*',
                    'java.awt.*',
                    'jdk.*',
                    'sun.*',
                    'org.springframework.*',
                    'lombok.*',
                    'org.springframework.*',
                    'lombok.*',
                },
                filteredTypes = {
                    'com.sun.*',
                    'io.micrometer.shaded.*',
                    'jakarta.*',
                    'java.awt.*',
                    'jdk.*',
                    'sun.*',
                    'org.springframework.*',
                    'lombok.*',
                }
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
