local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	vim.notify([[failed to load indent_blankline.nvim]])
	return
end

-- vim.cmd.highlight("default link IndentLine Comment")

indent_blankline.setup({
	scope = { enabled = true },
	indent = { char = "▏" },
})
