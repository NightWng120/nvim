--vim.opt.nocompatible = true
vim.opt.number = true
--let g:user_emmet_leader_key = '`'
--let g:python_highlight_all = 1
--let g:gruvbox_italic=1
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.rnu = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.format_on_save = true

vim.g.mapleader = " "
vim.keymap.set('x', '<leader>P', '\"_dP')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:q<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.keymap.set('n', '<C-t>', ':split term://bash<CR>i')
vim.keymap.set('i', 'jj', '<Esc>', {noremap = true})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {noremap = true})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {noremap = true})
vim.keymap.set('n', '<leader>b', ':b#<CR>', {noremap=true})
vim.keymap.set('n', '<leader>n', ':bn<CR>', {noremap=true})
vim.keymap.set('n', '<leader>p', ':bp<CR>', {noremap=true})
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true})
--imap jj <Esc>
