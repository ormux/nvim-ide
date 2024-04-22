local filetypes = {
	tmux = "tmux",
}

for key, val in pairs(filetypes) do
	vim.filetype.add({ extension = { [key] = val } })
end
