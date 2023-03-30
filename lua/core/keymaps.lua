local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- n = normal
-- i = insert
-- v = visual
-- x = block
-- t = terminal
-- c = commmand

keymap("i", "jk", "<ESC>", opts)

-- Split Navigation
keymap("n", "<C-h>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<C-j>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<C-k>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<C-l>", "<CMD>wincmd l<CR>", opts)

-- Tab Navigation
keymap("n", "<A-j>", "<CMD>tabprev<CR>", opts)
keymap("n", "<A-k>", "<CMD>tabnext<CR>", opts)
--keymap("n", "<Leader>h", "<CMD>tabprev<CR>", opts)
--keymap("n", "<Leader>l", "<CMD>tabnext<CR>", opts)

-- Buffer Navigation
keymap("n", "<A-h>", "<CMD>bprev<CR>", opts)
keymap("n", "<A-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<Leader>d", "<CMD>bdelete<CR>", opts)

-- File Input/Output
keymap("n", "<Leader>w", "<CMD>write<CR>", opts)
keymap("n", "<Leader>x", "<CMD>exit<CR>", opts)
keymap("n", "<Leader>q", "<CMD>quit!<CR>", opts)

-- Automatic Brace
keymap("i", ",.", "<ESC>A{<CR>}<ESC>ko", opts)

-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Nvim Tree
-- keymap("n", "<C-f>", "<CMD>NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>t", "<CMD>NvimTreeToggle<CR>", opts)

-- Null LS
keymap("n", "<Leader>p", ":Format<CR>", opts)

-- LaTeX Compile
keymap("n", "<Leader>l", "<CMD>!xelatex '%'<CR>", opts)
keymap("n", "<Leader>k", "<CMD>!xelatex --shell-escape 'main'<CR>", opts)
