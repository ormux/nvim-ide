local fn = vim.fn local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
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
    use { "luisiacc/gruvbox-baby", branch = "main"}

    -- VSCode Colorscheme
    use 'Mofiqul/vscode.nvim'

  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins

    -- Nvim Tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons'
      },
      tag = 'nightly',
      commit = "4900d66370988108dbe0f57cb8a2fc090878f73d"
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      commit = "c784720917bacb6716ce35ef07d464f5da738dd7"
    }

    -- Snippet Engine
    use { "L3MON4D3/LuaSnip", commit = "d8cacf83a214b7dd80986a8a24e4adf3fdd4f069" }

    -- Auto Completion
    use { "hrsh7th/nvim-cmp", commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
    use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }
    use { "hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
    use { "rafamadriz/friendly-snippets", commit = "7339def34e46237eb7c9a893cb7d42dcb90e05e6" }

    -- Language Server Protocol
    use { "neovim/nvim-lspconfig", commit = "47a521e621570da77e25c31988e2b74412db25e4" }
    use { "williamboman/nvim-lsp-installer", commit = "9c022b7a21885061e88f2f08fa8c0d81fbfa119a" }

    -- Null LS Formatter
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
  }

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)

