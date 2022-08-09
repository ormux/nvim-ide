local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok or null_ls == nil then
  vim.notify [[failed to load null-ls.]]
  return
end

local formatting = null_ls.builtins.formatting
--local dianostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier.with({
      extra_args = {"--single-quote", "--jsx-single-quote"}
    })
  }
})
