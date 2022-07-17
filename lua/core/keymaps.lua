local bind_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- SET LEADER KEY --
keymap("", "<Space>", "<Nop>", bind_opts)
vim.g.mapleader = " "

-- EDITOR MODES --
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
-- Split Navigation
keymap("n", "<C-h>", ":wincmd h<CR>", bind_opts)
keymap("n", "<C-j>", ":wincmd j<CR>", bind_opts)
keymap("n", "<C-k>", ":wincmd k<CR>", bind_opts)
keymap("n", "<C-l>", ":wincmd l<CR>", bind_opts)

-- Buffer Navigation
keymap("n", "<A-h>", ":bprev<CR>", bind_opts)
keymap("n", "<A-l>", ":bnext<CR>", bind_opts)

-- Tab Navigation
keymap("n", "<A-j>", ":tabp<CR>", bind_opts)
keymap("n", "<A-k>", ":tabn<CR>", bind_opts)

-- Write/Save/Quit
keymap("n", "<Leader>w", ":w<CR>", bind_opts)
keymap("n", "<Leader>x", ":x<CR>", bind_opts)
keymap("n", "<Leader>q", ":q!<CR>", bind_opts)

-- INSERT --
-- Remap Escape --
keymap("i", "jk", "<ESC>", bind_opts)

-- BLOCK --
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", bind_opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", bind_opts)

-- TERMINAL --
-- https://neovim.io/doc/user/nvim_terminal_emulator.html
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
