return {
	{ "luisiacc/gruvbox-baby", branch = "main" },
	"Mofiqul/vscode.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "nvim-tree/nvim-tree.lua", tag = "nightly" },
	{ "akinsho/bufferline.nvim", version = "*" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"L3MON4D3/LuaSnip",
	{
		"mattn/emmet-vim",
		init = function()
			vim.g.user_emmet_mode = "n"
			vim.g.user_emmet_leader_key = ","
		end,
	},

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g.mkdp_browser = "qutebrowser"
		end,
		ft = { "markdown" },
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jay-babu/mason-null-ls.nvim",

	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-telescope/telescope.nvim",
	"nvim-lualine/lualine.nvim",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	"folke/noice.nvim",
	"folke/which-key.nvim",
	"NvChad/nvim-colorizer.lua",

	-- Debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"jay-babu/mason-nvim-dap.nvim",
}
