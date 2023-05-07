return {
  { "luisiacc/gruvbox-baby",           branch = "main" },
  "Mofiqul/vscode.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  { "nvim-tree/nvim-tree.lua",         tag = "nightly" },
  { "akinsho/bufferline.nvim",         version = "*" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "L3MON4D3/LuaSnip",
  {
    "mattn/emmet-vim",
    init = function()
      vim.g.user_emmet_mode = "n"
      vim.g.user_emmet_leader_key = ","
    end,
    commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d",
  },
  { "hrsh7th/nvim-cmp",                  commit = "0f47dcaf7e39d64cd067e090e6f2eda6326e7366" },
  { "hrsh7th/cmp-nvim-lsp",              commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },
  { "hrsh7th/cmp-buffer",                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
  { "hrsh7th/cmp-path",                  commit = "91ff86cd9c29299a64f968ebb45846c485725f23" },
  { "hrsh7th/cmp-cmdline",               commit = "5af1bb7d722ef8a96658f01d6eb219c4cf746b32" },
  { "saadparwaiz1/cmp_luasnip",          commit = "18095520391186d634a0045dacaa346291096566" },
  { "rafamadriz/friendly-snippets",      commit = "10f741908e56ce47cf6b3440e3f04b4fdc0da2f2" },
  { "williamboman/mason.nvim",           commit = "057ac5ca159c83e302a55bd839a96ff1ea2396db" },
  { "williamboman/mason-lspconfig.nvim", commit = "cec0e6dd534ade486b5eeb59ebcfa8d51c3e8c5e" },
  { "neovim/nvim-lspconfig",             commit = "3bd4ca412982afa6f88bb7ef890660cee51c3e58" },
  { "jose-elias-alvarez/null-ls.nvim",   commit = "33b853a3933eed3137cd055aac4e539e69832ad0" },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_browser = "qutebrowser"
    end,
    ft = { "markdown" },
    lazy = true,
    commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
  },
  "numToStr/Comment.nvim",
  commit = "e1fe53117aab24c378d5e6deaad786789c360123",
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3" },
  { "nvim-telescope/telescope.nvim",               tag = "0.1.1" },
  { "nvim-lualine/lualine.nvim",                   commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9" },
  { "MunifTanjim/nui.nvim",                        commit = "698e75814cd7c56b0dd8af4936bcef2d13807f3c" },
  { "rcarriga/nvim-notify",                        commit = "159c6cf1be25a933f35e97499314c9faab55c98f" },
  { "folke/noice.nvim",                            commit = "6a7649413ef61123c333f422ee95840c04ece161" },
  "folke/which-key.nvim",
  "NvChad/nvim-colorizer.lua"
}
