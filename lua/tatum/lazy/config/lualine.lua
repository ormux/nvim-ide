local lualine_status_ok, lualine = pcall(require, "lualine")
local noice_status_ok, noice = pcall(require, "noice")

if not lualine_status_ok then
  vim.notify([[failed to load lualine.nvim]])
  return
end

if not noice_status_ok then
  vim.notify([[failed to load noice.nvim]])
  return
end

local function macro_recording()
  local mode = noice.api.statusline.mode.get()
  if mode then
    return string.match(mode, "^recording @.*") or ""
  end
  return ""
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
    lualine_c = { "filename", {
      macro_recording,
      cond = noice.api.statusline.mode.has,
      color = { fg = "#ff9e64" },
    } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
