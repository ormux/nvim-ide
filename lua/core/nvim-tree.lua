local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify [[failed to load nvim-tree.]]
  return
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
