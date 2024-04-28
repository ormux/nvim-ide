local status_ok, mason_conform = pcall(require, "mason-conform")

if not status_ok then
  vim.notify[[failed to load mason-conform.nvim]]
  return
end

mason_conform.setup()
