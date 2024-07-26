local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<localleader>j', '<CMD>diffget //2<CR>', opts)
keymap('n', '<localleader>k', '<CMD>diffget //3<CR>', opts)
