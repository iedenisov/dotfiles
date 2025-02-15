return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
      on_highlights = function (colors, color)
          ---@type solarized.highlights
          local groups = {
              SpellBad = { underline = false, strikethrough = false, undercurl = true },
          }
          return groups
      end,

      plugins = {
          rendermarkdown = true,
      },
      variant = 'winter',
  },
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = 'light'
    require('solarized').setup(opts)
  end,
}
