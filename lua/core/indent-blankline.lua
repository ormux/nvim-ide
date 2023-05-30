local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify([[failed to load indent_blankline.nvim]])
	return
end

-- vim.cmd.highlight("default link IndentLine Comment")

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true
})
