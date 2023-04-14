local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  vim.notify [[failed to load nvim-lualine.nvim]]
  return
end

lualine.setup {
  options = {
    theme = 'gruvbox-material',
    section_separators = '',
    component_separators = ''
  }
}
