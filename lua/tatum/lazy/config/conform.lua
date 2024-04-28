local status_ok, conform = pcall(require, "conform")

if not status_ok then
	vim.notify([[failed to load conform.nvim]])
end

conform.lsp_fallback = true

conform.formatters.prettier = {
	prepend_args = { "--jsx-single-quote", "true" },
}

conform.formatters_by_ft = {
  lua = { "stylua" },
  python = { "isort", "black" },

  javascript = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },

  cs = { "csharpier" },
  sh = { "shfmt" },
  zsh = { "shfmt" },
}

conform.setup()
