local status_ok, conform = pcall(require, "conform")

if not status_ok then
	vim.notify([[failed to load conform.nvim]])
end

conform.lsp_fallback = true

conform.formatters.prettier = {
	prepend_args = { "--jsx-single-quote", "true" },
}

conform.formatters.djlint = {
	prepend_args = { "--indent", "2" },
}

conform.formatters_by_ft = {
	lua = { "stylua" },
	python = { "black", "isort" },
	html = { "prettier" },
	htmldjango = { "djlint" },
	scss = { "prettier" },
	json = { "prettier" },

	javascript = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },

	cs = { "csharpier" },
	sh = { "shfmt" },
	zsh = { "shfmt" },
}

conform.setup()
