local builtin = require('telescope.builtin')

--Probably need to change these keymaps later to suit my liking
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Space>fe', builtin.diagnostics, {})
