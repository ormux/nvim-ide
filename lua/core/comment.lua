local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify [[failed to load Comment.nvim]]
  return
end

local prehook_ok, prehook = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
if not prehook_ok then
  vim.notify [[failed to load pre_hook (Comment.nvim)]]
  return
end

comment.setup {
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = '<C-c>',
    block = '<C-x>',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
  pre_hook = prehook.create_pre_hook(),
  post_hook = nil,
}
