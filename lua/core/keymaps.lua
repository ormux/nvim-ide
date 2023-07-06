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
keymap("n", "<leader>y", [["+y]], opts)

-- Split Navigation
keymap("n", "<C-h>", "<CMD>wincmd h<CR>", opts)
keymap("n", "<C-j>", "<CMD>wincmd j<CR>", opts)
keymap("n", "<C-k>", "<CMD>wincmd k<CR>", opts)
keymap("n", "<C-l>", "<CMD>wincmd l<CR>", opts)

--https://github.com/rcarriga/nvim-dap-ui/issues/243#issuecomment-1441514038
keymap("t", "<C-h>", "<CMD>wincmd h<CR>", opts)
keymap("t", "<C-j>", "<CMD>wincmd j<CR>", opts)
keymap("t", "<C-k>", "<CMD>wincmd k<CR>", opts)
keymap("t", "<C-l>", "<CMD>wincmd l<CR>", opts)

keymap("n", "<leader>vs", "<CMD>vsplit<CR>", opts)
keymap("n", "<leader>hs", "<CMD>split<CR>", opts)

-- Tab Navigation
keymap("n", "<A-j>", "<CMD>tabprev<CR>", opts)
keymap("n", "<A-k>", "<CMD>tabnext<CR>", opts)
--keymap("n", "<Leader>h", "<CMD>tabprev<CR>", opts)
--keymap("n", "<Leader>l", "<CMD>tabnext<CR>", opts)

-- Buffer Navigation
keymap("n", "<A-h>", "<CMD>bprev<CR>", opts)
keymap("n", "<A-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<leader>bd", "<CMD>bdelete<CR>", opts)

-- File Input/Output
keymap("n", "<leader>w", "<CMD>write<CR>", opts)
keymap("n", "<leader>x", "<CMD>exit<CR>", opts)
keymap("n", "<leader>q", "<CMD>quit!<CR>", opts)

-- Automatic Brace
keymap("i", ",.", "<ESC>A{<CR>}<ESC>ko", opts)

-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
-- keymap("v", "<S-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("v", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Window Resize
keymap("n", "<S-h>", "<CMD>vertical-resize -2<CR>", opts)
keymap("n", "<S-j>", "<CMD>resize -1<CR>", opts)
keymap("n", "<S-k>", "<CMD>resize +1<CR>", opts)
keymap("n", "<S-l>", "<CMD>vertical-resize +2<CR>", opts)

-- Nvim Tree
-- keymap("n", "<C-f>", "<CMD>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>t", "<CMD>NvimTreeToggle<CR>", opts)

-- Null LS
keymap("n", "<leader>F", ":Format<CR>", opts)

-- LaTeX Compile
keymap("n", "<leader>l", "<CMD>!xelatex '%'<CR>", opts)
keymap("n", "<leader>k", "<CMD>!xelatex --shell-escape 'main'<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opts)
