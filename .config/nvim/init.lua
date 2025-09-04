require("config.lazy")

vim.cmd("set background=dark");
vim.cmd("colorscheme everforest");

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

-- netrw
-- vim.g.netrw_liststyle = 1;
vim.g.netrw_sort_by = 'name';
vim.g.netrw_alto = 1;
vim.g.netrw_altv = 1;
vim.g.netrw_banner = 0;

-- spelling
vim.o.spell = true;
vim.o.spelllang = 'en,ru,de';

-- wildmenu
vim.o.wildmode = 'longest:full,full';

-- smartcase support
vim.o.ignorecase = true;
vim.o.smartcase = true;


-- bindings
vim.keymap.set('n', '<Up>', 'gk');
vim.keymap.set('i', '<Up>', '<C-o>gk');
vim.keymap.set('n', '<Down>', 'gj');
vim.keymap.set('i', '<Down>', '<C-o>gj');
vim.keymap.set('n', '<leader>i', function() vim.diagnostic.open_float() end);
vim.keymap.set('n', '<leader>cl', function() vim.cmd('set background=light') end);
vim.keymap.set('n', '<leader>cd', function() vim.cmd('set background=dark') end);
vim.keymap.set('n', '<leader>cc', function () if vim.o.background == 'dark' then vim.cmd('set background=light') elseif vim.o.background == 'light' then vim.cmd('set background=dark') end end);
vim.keymap.set('n', '<leader>ee', function () vim.cmd('Ex') end);
vim.keymap.set('n', '<leader>ev', function () vim.cmd('Vex') end);
vim.keymap.set('n', '<c-w>N', function () vim.cmd('vne') end);


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Telescope colorscheme' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope find marks'})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope find references (LSP)'})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope find symbols (LSP)'})
vim.keymap.set('n', '<leader>fc', builtin.lsp_incoming_calls, { desc = 'Telescope find incoming calls (LSP)'})
vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls, { desc = 'Telescope find outgoing calls (LSP)'})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'Telescope find implementations (LSP)'})
vim.keymap.set('n', '<leader>fx', builtin.diagnostics, { desc = 'Telescope find errors (LSP)'})

vim.keymap.set('v', '<leader>to', function() return ':!echo "$(cat)" >> ' .. vim.fn.input("Filename: ") .. "<cr>" end, { expr = true });

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.wo.wrap = true
  end,
})
