local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
	vim.notify([[failed to load mason-null-ls]])
	return
end
mason_null_ls.setup({
 ensure_installed = { "black", "clang-format", "csharpier", "latextindent", "luaformatter", "shfmt", "stylua" } 
})
