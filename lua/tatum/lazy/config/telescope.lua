local status_ok, telescope = pcall(require, "telescope")
if not status_ok or telescope == nil then
	vim.notify([[failed to load telescope.]])
	return
end

telescope.setup({})
