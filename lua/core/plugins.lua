local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installed packer, please restart Neovim")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notfy("failed to load packer.")
	return
end

-- https://github.com/wbthomason/packer.nvim#using-a-floating-window
packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Gruvbox Colorscheme
	use({ "luisiacc/gruvbox-baby", branch = "main" })

	-- VSCode Colorscheme
	use({ "Mofiqul/vscode.nvim" })

	use({
		"nvim-lua/plenary.nvim",
		commit = "253d34830709d690f013daf2853a9d21ad7accab",
	})

	use({
		"kyazdani42/nvim-web-devicons",
		commit = "c3c1dc4e36969370ff589b7025df8ec2e5c881a2",
	})

	-- Nvim Tree
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Snippet Engine
	use({
		"L3MON4D3/LuaSnip",
	})

	-- HTML Snippets
	use({
		"mattn/emmet-vim",
		setup = function()
			vim.g.user_emmet_mode = "n"
			vim.g.user_emmet_leader_key = ","
		end,
	})

	-- Auto Completion
	use({ "hrsh7th/nvim-cmp", commit = "01f697a68905f9dcae70960a9eb013695a17f9a2" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" })
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })
	use({ "hrsh7th/cmp-cmdline", commit = "8fcc934a52af96120fe26358985c10c035984b53" })
	use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" })
	use({ "rafamadriz/friendly-snippets", commit = "009887b76f15d16f69ae1341f86a7862f61cf2a1" })

	-- Language Server Protocol
	use({ "williamboman/mason.nvim", commit = "51228a60d1a5017030429ba38f018ff27a460c76" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "e4badf7984f7a5f0ac7dc10657dbedbd99a82f94" })
	use({ "neovim/nvim-lspconfig", commit = "a557dd4d493e6afba3c24ffeb96fa32695f00874" })

	-- Null LS Formatter
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "456cd2754c56c991c5e4df60a807d054c1bc7148" })

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_browser = "qutebrowser"
		end,
		opt = true,
		ft = { "markdown" },
	})

	use({ "numToStr/Comment.nvim", commit = "6821b3ae27a57f1f3cf8ed030e4a55d70d0c4e43" })

	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52" })

	use({ "OmniSharp/omnisharp-vim" })

	use({ "dense-analysis/ale" })

	use({ "neoclide/coc.nvim", branch = "release" })

  use { 'nvim-lualine/lualine.nvim' }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
