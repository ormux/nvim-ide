local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok or mason_lspconfig == nil then
  vim.notify([[failed to load mason-lspconfig.]])
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "bashls",
  "clangd",
  "csharp_ls",
  "cssls",
  "html",
  "jsonls",
  "lua_ls",
  "pylsp",
  "ts_ls",
  "perlnavigator",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = false,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("tatum.lazy.config.lsp.handlers").on_attach,
    capabilities = require("tatum.lazy.config.lsp.handlers").capabilities,
  }

  local has_opts, server_opts = pcall(require, "tatum.lazy.config.lsp.settings." .. server)
  if has_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  lspconfig[server].setup(opts)
end
