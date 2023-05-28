local status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not status_ok then
  vim.notify([[failed to load mason-nvim-dap]])
  return
end

mason_nvim_dap.setup({
  ensure_installed = { "js", "coreclr" },
  automatic_installation = true
})
