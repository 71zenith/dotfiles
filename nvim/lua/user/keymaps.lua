local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<S-h>' , ':tabp<CR>', opts )
keymap('n', '<S-l>' , ':tabN<CR>', opts )
keymap('n', '<C-h>', '<C-w>h', opts )
keymap('n', '<C-l>', '<C-w>l', opts )
keymap('n', '<C-n>', '<C-w>n', opts )
keymap('n', '<C-j>', '<C-w>j', opts )
keymap('n', '<C-k>', '<C-w>k', opts )
