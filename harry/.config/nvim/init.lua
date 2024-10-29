-- mouse
vim.o.mouse = "a"

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- spellcheck
vim.o.spell = true
vim.o.spelllang = 'en,ru,de'

-- indentation
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.tabstop = 2

vim.o.wrap = true
vim.o.linebreak = true

vim.o.clipboard = 'unnamedplus'

vim.o.splitbelow = true
vim.g.netrw_banner = false
vim.g.netrw_altv = true

-- folds
-- vim.o.foldmethod = 'indent'
-- vim.o.foldcolumn = '3'
-- 
-- -- save on leaving buffers and windows
-- vim.api.nvim_create_autocmd('BufWinLeave', {
--   command = 'silent! :mkview'
-- })
-- 
-- -- apply on entering buffers and windows
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   command = ':silent! loadview'
-- })

-- bindings
vim.g.mapleader = " "
vim.g.mapllleader = " "

vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('i', '<Up>', '<C-o>gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('i', '<Down>', '<C-o>gj')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    {import = 'plugins'},
    {import = 'plugins.lsp'},
  }
)

-- colorscheme
vim.cmd("colorscheme zenbones");

vim.api.nvim_create_autocmd('FileType', {
  pattern = {"TelescopeResults"},
  command = "setlocal nofoldenable"
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
