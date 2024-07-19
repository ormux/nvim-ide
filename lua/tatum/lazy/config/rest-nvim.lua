local status_ok, rest_nvim = pcall(require, "rest-nvim")

if not status_ok then
	vim.notify([[failed to load rest.nvim]])
	return
end

rest_nvim.setup({
  keybinds = {
    { "<localleader>rs", "<CMD>Rest run<cr>", "Run request under the cursor" },
    { "<localleader>rl", "<CMD>Rest run last<cr>", "Run request under the cursor" },
  },
})

-- important noremap should not be used
-- local opts = { noremap = false, silent = true }
-- local keymap = vim.keymap.set

-- keymap("n", "<leader>rs", "<Plug>RestNvim", opts)
-- keymap("n", "<leader>rp", "<Plug>RestNvimPreview", opts)
-- keymap("n", "<leader>rl", "<Plug>RestNvimLast", opts)
