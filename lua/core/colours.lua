local colorscheme = "gruvbox-baby"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify "failed to set colorscheme"
  return
end
