local options = {
	autoindent = true,
	autoread = true,
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
	smartindent = true,
	softtabstop = 2,
	swapfile = false,
	tabstop = 2,
	undofile = true,
	wildmenu = true,
	writebackup = false,
  numberwidth = 2,
  termguicolors = true,
}

for key, val in pairs(options) do
	vim.opt[key] = val
end

vim.cmd [[set iskeyword+=-]] -- brackets = multi-line strings
