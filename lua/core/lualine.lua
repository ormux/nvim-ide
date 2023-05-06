local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  vim.notify([[failed to load lualine.nvim]])
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox",
    section_separators = "",
    component_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  }
})
