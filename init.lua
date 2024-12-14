require 'config.lazy'
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.cmd [[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.cmd 'set expandtab'
vim.cmd 'set tabstop=4'
vim.cmd 'set softtabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'set number'
vim.cmd 'set relativenumber'
vim.cmd 'set cursorline'
vim.cmd 'colorscheme tokyonight-night'
vim.cmd 'set scrolloff=6'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.timeoutlen = 300
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal right<CR>')
