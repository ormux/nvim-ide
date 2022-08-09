local bind_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- SET LEADER KEY --
keymap("", "<Space>", "<Nop>", bind_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- EDITOR MODES --
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", ";", ":", bind_opts)
keymap("i", "jk", "<ESC>", bind_opts)

-- Split Navigation
keymap("n", "<C-h>", "<CMD>wincmd h<CR>", bind_opts)
keymap("n", "<C-j>", "<CMD>wincmd j<CR>", bind_opts)
keymap("n", "<C-k>", "<CMD>wincmd k<CR>", bind_opts)
keymap("n", "<C-l>", "<CMD>wincmd l<CR>", bind_opts)

-- Buffer Navigation
keymap("n", "<A-h>", "<CMD>bprev<CR>", bind_opts)
keymap("n", "<A-l>", "<CMD>bnext<CR>", bind_opts)

-- Tab Navigation
keymap("n", "<A-j>", "<CMD>tabp<CR>", bind_opts)
keymap("n", "<A-k>", "<CMD>tabn<CR>", bind_opts)

-- Write/Save/Quit
keymap("n", "<Leader>w", "<CMD>w<CR>", bind_opts)
keymap("n", "<Leader>x", "<CMD>x<CR>", bind_opts)
keymap("n", "<Leader>q", "<CMD>q!<CR>", bind_opts)

-- Nvim Tree
keymap("n", "<C-f>", "<CMD>NvimTreeToggle<CR>", bind_opts)

-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("x", "<A-j>", "<CMD>move '>+1<CR>gv-gv", bind_opts)
keymap("x", "<A-k>", "<CMD>move '<-2<CR>gv-gv", bind_opts)

-- Automatic Bracing
keymap("n", "<LocalLeader>.", "A{<CR>}<ESC>O", bind_opts)
keymap("i", "<LocalLeader>.", "<ESC>A{<CR>}<ESC>O", bind_opts)

-- Null-LS Format
keymap("n", "<LocalLeader>p", "<CMD>Format<CR>", bind_opts)

-- TERMINAL --
-- https://neovim.io/doc/user/nvim_terminal_emulator.html
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
