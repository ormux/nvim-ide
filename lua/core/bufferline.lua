local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify [[failed to load bufferline.]]
  return
end

bufferline.setup({})
