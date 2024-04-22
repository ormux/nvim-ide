local status_ok, whichkey = pcall(require, 'which-key')
if not status_ok then
  vim.notify([[failed to load which-key.nvim]])
  return
end

whichkey.setup()
