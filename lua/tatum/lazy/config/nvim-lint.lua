local status_ok, lint = pcall(require, "lint")
if not status_ok then
	vim.notify([[failed to load nvim-lint.]])
end

lint.linters_by_ft = {
  python = { "flake8" },
	cpp = { "cpplint" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	lua = { "selene" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
	bash = { "shellcheck" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
