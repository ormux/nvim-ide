local status_ok, conform = pcall(require, "conform")

if not status_ok then
  vim.notify[[failed to load conform.nvim]]
end

conform.setup({
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    cs = { "csharpier" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
  },
})
