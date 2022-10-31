-- :help vim.fn
local fn = vim.fn

-- :help stdpath
-- fn.stdpath "data" = $XDG_DATA_HOME/nvim/
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- :help empty, :help glob, :help system, :help packadd
-- https://github.com/wbthomason/packer.nvim#bootstrapping
-- install packer if path is empty
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "# installed packer.nvim, restart neovim."
  vim.cmd [[packadd packer.nvim]]
end

-- reload neovim upon BufWritePost of plugins.lua 
-- :help events, :help augroup, :help afile
vim.cmd([[
  augroup packer_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- checking packer, cease execution upon error
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify "packer failed to load..."
  return
end

-- https://github.com/wbthomason/packer.nvim#using-a-floating-window
-- customize packer use popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- https://github.com/wbthomason/packer.nvim#bootstrapping
return packer.startup(
  function (use)
    -- Self-manage Packer
    use "wbthomason/packer.nvim"
    -- Colour Scheme
    use {'luisiacc/gruvbox-baby', branch = "main"}
    -- Completion Engine
    use { "hrsh7th/nvim-cmp", commit = "c4dcb1244a8942b8d2bd3c0a441481e12f91cdf1" }
    use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }
    use { "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
    use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
    use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }
    -- Snippet Engine
    use { "L3MON4D3/LuaSnip", commit = "be3083bbb8ebc21671bf7c91c27f043ebe0a8d8d" }
    use "rafamadriz/friendly-snippets"

    -- Language Server Protocol
    use { "neovim/nvim-lspconfig", commit = "ba25b747a3cff70c1532c2f28fcc912cf7b938ea" }
    use { "williamboman/nvim-lsp-installer", commit = "ff51c2173d2917517c96f22d9c21940307930b57" }

    -- Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- File Explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Null LS Formatter
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {
      "mattn/emmet-vim",
      setup = function()
        vim.g.user_emmet_mode="n"
        vim.g.user_emmet_leader_key = ","
      end
    }

   use {
       "iamcco/markdown-preview.nvim",
       run = function() vim.fn["mkdp#util#install"]() end,
       ft = { "markdown" },
   }

    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end
)
