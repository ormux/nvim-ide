local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify "failed to load nvim-lsp-installer"
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "jsonls",
  "sumneko_lua",
  "tsserver"
}

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("core.lsp.handlers").on_attach,
    capabilities = require("core.lsp.handlers").capabilities,
  }

  -- if server.name == "jsonls" then
	--  local jsonls_opts = require("user.lsp.settings.jsonls")
	-- 	opts = vim.tbl_deep_extend("force", opts, jsonls_opts)
	-- end

  local has_opts, server_opts = pcall(require, "core.lsp.settings." .. server)
  if has_opts then
    opts = vim.tbl_deep_extend("force", opts, server_opts)
  end

  lspconfig[server].setup(opts)
end
