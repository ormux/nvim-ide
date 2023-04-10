local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok or null_ls == nil then
  vim.notify([[failed to load null-ls.]])
  return
end

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    formatting.prettier.with({
      extra_args = { "--single-quote", "--jsx-single-quote" }
    }),
    formatting.stylua,
    formatting.clang_format.with({
      filetypes = {
        'c', 'cc', 'cpp'
      }
    }),
    formatting.black,
    diagnostic.cpplint,
  },
})
