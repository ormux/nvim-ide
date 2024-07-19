local options = {
	autoindent = false,
	smartindent = true,
	backup = false,
	-- clipboard = "unnamed,unnamedplus",
	errorbells = false,
	expandtab = true,
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	laststatus = 3,
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
}

for key, val in pairs(options) do
	vim.opt[key] = val
end
