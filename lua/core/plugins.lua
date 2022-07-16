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
  function () 
    use "wbthomason/packer.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use "flazz/vim-colorschemes"
    use {'luisiacc/gruvbox-baby', branch = "main"}

    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end
)
