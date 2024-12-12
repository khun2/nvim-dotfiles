require 'config.lazy'
--require 'lua.lsp_diagnostics_options_setup'

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd [[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]

vim.cmd 'set expandtab'
vim.cmd 'set tabstop=4'
vim.cmd 'set softtabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'set number'
vim.cmd 'set relativenumber'
vim.cmd 'set cursorline'
vim.cmd 'colorscheme tokyonight-night'
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal right<CR>')
