<h1 align='center'>NVIM v0.10.0-dev</h1>

<div align='center'>
Tatum's personal neovim text-editor customised to be a functional IDE for coding
</div>

<hr />

<div align='center'>
<img src="./images/nvim-tree.png" alt="nvim-tree demo" />
<img src="./images/nvim-dap.png" alt="nvim-dap demo" />
<img src="./images/noice.png" alt="noice demo" />
</div>

<h2 align='center'>Setup</h2>

1. Clone this repo and place it to the `$XDG_CONFIG_HOME` location

* `cd $XDG_CONFIG_HOME`  
* `git clone git@github.com:tatumroaquin/nvim.git`

2. Delete the README document to prevent clutter

* `rm README.md`

3. Allow git to ignore the changes made to the README

* `git update-index --assume-unchanged README.md`

<h2 align='center'>Components</h2>

### Plugin manager
* [lazy.nvim](https://github.com/wbthomason/packer.nvim) - manages lua plugins from the neovim eco-system

### Syntax tree parser
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provide syntax highlighting

### Completion and intellisense
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
* [cmp-path](https://github.com/hrsh7th/cmp-path)
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

### File tree and fuzzy finder
* [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - sidebar tree file explorer
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - fuzzy file finder

### Linters and formatters
* [nvim-lint](mfussenegger/nvim-lint) - code linting, integrates with mason
* [conform.nvim](https://github.com/stevearc/conform.nvim) - code formatter, integerates with mason

### LSP and DAP
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - quickstart configs for nvim LSP
* [nvim-dap](https://github.com/mfussenegger/nvim-dap) - debug adapter protocol client implementation for neovim
* [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - a UI for nvim-dap

### Mason.nvim: package manager (LSP, DAP, and Linters)
* [mason-lspconfig](https://github.com/williamboman/mason-lspconfig) - ease-of-use plugin that bridges nvim-lspconfig and mason.nvim
* [mason-nvim-dap](https://github.com/jay-babu/mason-nvim-dap.nvim) - allows for automatic installation of DAP debuggers
* [mason-nvim-lint](https://github.com/rshkarin/mason-nvim-lint) - mason extension to auto-install required linters.
* [mason-conform.nvim](https://github.com/zapling/mason-conform.nvim) - mason extension to auto-install required formatters.

#### Tpope plugins: git, databases, and vim sessions
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - git wrapper interface plugin for neovim
* [vim-dadbod](https://github.com/tpope/vim-dadbod) - database remote cli interface for neovim
* [vim-obsession](https://github.com/tpope/vim-obsession) - session auto-saver plugin for neovim

### Code Snippets
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine for neovim written in lua
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - set of preconfigured snippets for different programming languages
* [Emmet-vim](https://github.com/mattn/emmet-vim) - the infamous emmet plugin in vscode for rapid HTML coding

### Miscellaneous
* [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - provides a live preview of markdown files
* [nvim-silicon](https://github.com/michaelrommel/nvim-silicon) - nvim interface for [silicon](https://github.com/Aloxaf/silicon), code image screenshots
* [Comment.nvim](https://github.com/numToStr/Comment.nvim) - intelligent comment plugin for neovim
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - better status line for neovim
* [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - VSCode-like identation guide-lines for neovim
* [noice](https://github.com/folke/noice.nvim) - better neovim UI for cli prompts, notifications, and buffers.
* [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) - high-performance colour highlighter for neovim
* [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - for seamless pane navigation between neovim and tmux

#### sources:
<https://github.com/LunarVim/Neovim-from-scratch>  
<https://github.com/LunarVim/nvim-basic-ide>  
<https://github.com/rockerBOO/awesome-neovim>  
<https://harrisoncramer.me/debugging-in-neovim>  
