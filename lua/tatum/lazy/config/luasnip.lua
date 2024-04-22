-- local status_ok, luasnip = pcall(require, "luasnip.loaders.from_vscode")
-- 
-- if not status_ok then
--   vim.notify[[failed to load LuaSnip.]]
-- end

require("luasnip.loaders.from_vscode").lazy_load()
