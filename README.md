<h1 align='center'>NVIM v0.7.2</h1>

Neovim text-editor customised to be a functional IDE for coding

<h2 align='center'>Setup</h2>
Clone this repo and place it to the `$XDG_CONFIG_HOME` location

`git clone git@github.com:ormux/nvim-ide.git $HOME/.config/nvim`

Delete the README document to prevent clutter

`rm README.md`

Allow git to ignore the changes made to the README

`git update-index --assume-unchanged README.md`

<h2 align='center'>Components</h2>

### Plugin Manager
* [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Completion
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
* [cmp-path](https://github.com/hrsh7th/cmp-path)
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

### File Finding
* [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

### Formatting
* [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)

### Syntax
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### LSP
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

### Snippets
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### Miscellaneous
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

#### sources:
<https://github.com/LunarVim/Neovim-from-scratch>  
<https://github.com/LunarVim/nvim-basic-ide>  
<https://github.com/rockerBOO/awesome-neovim>  
