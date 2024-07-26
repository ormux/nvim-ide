local status_ok, fzf_lua = pcall(require, "fzf-lua")

if not status_ok then
	vim.notify([[failed to load fzf-lua]])
	return
end

fzf_lua.setup({
  'fzf-native',
	files = {
		fd_opts = "--type f -E .git -E node_modules",
    find_opts = "-type f \\( ! -path '*/.git/*' -a ! -path '*/node_modules/*' \\) -printf '%P\n'"
	},
})
