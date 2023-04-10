local options = {
	autoindent = true,
	backup = false,
	clipboard = "unnamed,unnamedplus",
	errorbells = false,
	expandtab = true,
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	laststatus = 2,
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	smartcase = true,
	softtabstop = 2,
	swapfile = false,
	tabstop = 2,
	wildmenu = true,
	writebackup = false,
  modeline = false,
  numberwidth = 2,
  termguicolors = true,
  undofile = true,
  wrap = true,
  syntax = 'on',
}

vim.g.OmniSharp_server_use_net6 = 1

vim.g.ale_linters = {
 cs = {'OmniSharp'}
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
