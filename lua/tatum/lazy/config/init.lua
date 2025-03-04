local C = {
	"colours",
	"cmp",
	"lsp",
	"luasnip",
	"treesitter",
	"nvim-tree",
	"bufferline",
	"lualine",
	"comment",
	"indent-blankline",
	"notify",
	"noice",
	"colorizer",
	"telescope",
	"fzf-lua",
	"mason",
	"conform",
	"mason-lspconfig",
	"mason-nvim-lint",
	"mason-conform",
	"mason-nvim-dap",
	"nvim-dap-ui",
	"rest-nvim",
	"nvim-lint",
	"nvim-silicon",
	"markdown-preview",
	-- "obsidian",
	"vim-fugitive",
}
for _, config in ipairs(C) do
	require("tatum.lazy.config." .. config)
end
