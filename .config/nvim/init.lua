require("config.lazy");

vim.cmd("colorscheme edge");

-- line and column highlighting
vim.o.cursorline = true;
vim.o.cursorcolumn = true;

vim.o.mouse = 'a';
vim.o.number = true;
vim.o.relativenumber = true;

-- indentation
vim.o.autoindent = true;
vim.o.expandtab = true;
vim.o.shiftround = true;
vim.o.shiftwidth = 4
vim.o.smarttab = true;
vim.o.tabstop = 4;

vim.o.wrap = true;
vim.o.linebreak = true;

vim.o.clipboard = 'unnamedplus';

vim.o.splitbelow = true;

-- spelling
vim.o.spell = true;
vim.o.spelllang = "en,ru,de";


-- bindings
vim.keymap.set('n', '<Up>', 'gk');
vim.keymap.set('i', '<Up>', '<C-o>gk');
vim.keymap.set('n', '<Down>', 'gj');
vim.keymap.set('i', '<Down>', '<C-o>gj');
vim.keymap.set('n', '<leader>i', function() vim.diagnostic.open_float() end);
vim.keymap.set('n', '<leader>cl', function() vim.cmd('set background=light') end);
vim.keymap.set('n', '<leader>cd', function() vim.cmd('set background=dark') end);
vim.keymap.set('n', '<leader>cc', function () if vim.o.background == 'dark' then vim.cmd('set background=light') elseif vim.o.background == 'light' then vim.cmd('set background=dark') end end);
vim.keymap.set('n', '<leader>e', function () vim.cmd('Ex') end);


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Telescope colorscheme' })
