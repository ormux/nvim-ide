local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify "nvim-tree failed to load."
  return
end

nvim_tree.setup()
