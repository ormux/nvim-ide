# NVIM v0.7.2
Neovim text-editor customised to be a functional IDE for coding

## Setup
Clone this repo and place it to the `$XDG_CONFIG_HOME` location

`git clone git@github.com:ormux/nvim-ide.git $HOME/.config/nvim`

Delete the README document to prevent clutter

`rm README.md`

This allows git to ignore the changes made to the README.md

`git update-index --assume-unchanged README.md`

## Plugins
Plugin manager of choice is Packer written in Lua

### Completion
* nvim-cmp
* cmp-nvim-lsp
* cmp-buffer
* cmp-path
* cmp-cmdline
* cmp_luasnip

### Formatting
* null-ls

### LSP
* nvim-lspconfig
* nvim-lsp-installer

### Snippets
* LuaSnip
* friendly-snippets

### Miscellaneous
* markdown-preview
