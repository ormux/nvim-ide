local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify "failed to load treesitter."
  return
end

-- https://github.com/nvim-treesitter/nvim-treesitter#modules
configs.setup {
  ensure_installed = {
    "c", "cpp", "javascript", "typescript", "markdown"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
