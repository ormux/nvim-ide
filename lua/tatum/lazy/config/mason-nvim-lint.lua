local status_ok, mason_nvim_lint = pcall(require, "mason-nvim-lint")

if not status_ok then
  vim.notify[[failed to load mason-nvim-lint.]]
  return
end

local M = {
    ensure_installed = { "selene", "vale", "cpplint", "yamllint"},
    automatic_installation = true,
    quiet_mode = false,
}

mason_nvim_lint.setup(M)
