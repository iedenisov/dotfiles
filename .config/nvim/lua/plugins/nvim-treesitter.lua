return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({

            lazy = false,
            ensure_installed = {
                "apex",
                "bash",
                "c",
                "cpp",
                "css",
                "diff",
                "dockerfile",
                "go",
                "html",
                "http",
                "java",
                "javascript",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "properties",
                "python",
                "regex",
                "rust",
                "soql",
                "sql",
                "tsx",
                "typescript",
                "xml",
                "yaml",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            }
        })
    end
}
