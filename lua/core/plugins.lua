return {
	{ "luisiacc/gruvbox-baby", branch = "main" },

	-- Dependencies
	"Mofiqul/vscode.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	-- File Tree
	{ "nvim-tree/nvim-tree.lua", tag = "nightly" },

	-- Tabs for Buffers
	{ "akinsho/bufferline.nvim", version = "*" },

	-- Syntax Highlighting
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- Emmet Tool
	{
		"mattn/emmet-vim",
		init = function()
			vim.g.user_emmet_mode = "n"
			vim.g.user_emmet_leader_key = ","
		end,
	},

	-- Snippet Engine
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",

	"neovim/nvim-lspconfig",
	{ "jose-elias-alvarez/null-ls.nvim" },
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

	-- Mason Package Manager
	"williamboman/mason.nvim",

	-- Mason Autoconfig Language Servers
	"williamboman/mason-lspconfig.nvim",

	-- Mason Autoinstall Code Formatters
	"jay-babu/mason-null-ls.nvim",

	-- Auto Comments
	"numToStr/Comment.nvim",
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- File Finding
	"nvim-telescope/telescope.nvim",

	-- Status Line
	"nvim-lualine/lualine.nvim",

	-- Noice.nvim
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	"folke/noice.nvim",
	{ "folke/which-key.nvim", lazy = true },
	{ "NvChad/nvim-colorizer.lua" },

	-- Nvim DAP
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "jay-babu/mason-nvim-dap.nvim" },

	-- Indentation Lines
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
