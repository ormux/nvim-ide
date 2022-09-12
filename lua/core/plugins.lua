local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  print("Installed packer, please restart Neovim")
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notfy "failed to load packer."
  return
end

-- https://github.com/wbthomason/packer.nvim#using-a-floating-window
packer.init({
  display = {
    open_fn = require("packer.util").float
  }
})

return packer.startup(
  function(use)
    use { "wbthomason/packer.nvim" }

    -- Gruvbox Colorscheme
    use { "luisiacc/gruvbox-baby", branch = "main" }

    -- VSCode Colorscheme
    use { "Mofiqul/vscode.nvim" }

    use {
      "nvim-lua/plenary.nvim",
      commit = "a3dafaa937921a4eb2ae65820c3479ab561e9ba3",
    }

    use { 'kyazdani42/nvim-web-devicons' }

    -- Nvim Tree
    use {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly',
      commit = "4900d66370988108dbe0f57cb8a2fc090878f73d",
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      commit = "c398cbc8f584131e4f0e2e358664946487885d2a",
    }

    -- Snippet Engine
    use {
      "L3MON4D3/LuaSnip",
      commit = "17702640bd627c732ac5e9ca5fab089acd737dc6",
    }

    -- HTML Snippets
    use {
      "mattn/emmet-vim",
      setup = function()
        vim.g.user_emmet_mode = "n"
        vim.g.user_emmet_leader_key = "'"
      end
    }

    -- Auto Completion
    use { "hrsh7th/nvim-cmp", commit = "33fbb2c3d2c512bd79ea03cf11fea405cbe618a9" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
    use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }
    use { "hrsh7th/cmp-cmdline", commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e" }
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
    use { "rafamadriz/friendly-snippets", commit = "e5a16f9346e1fa24147d6d23460ca9b41528ab7e" }

    -- Language Server Protocol
    use { "neovim/nvim-lspconfig", commit = "0fafc3ef648bd612757630097c96b725a36a0476" }
    use { "williamboman/nvim-lsp-installer", commit = "ae913cb4fd62d7a84fb1582e11f2e15b4d597123" }

    -- Null LS Formatter
    use { "jose-elias-alvarez/null-ls.nvim", commit = "de751688c991216f0d17ced7d5076e0c37fa383f" }

    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
      setup = function() vim.g.mkdp_browser = 'qutebrowser' end,
      opt = true,
      ft = { "markdown" },
    }

    use { "numToStr/Comment.nvim", commit = "30d23aa2e1ba204a74d5dfb99777e9acbe9dd2d6" }

    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)
