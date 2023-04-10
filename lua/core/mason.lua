local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok or mason == nil then
  vim.notify [[failed to load mason.]]
  return
end

local mason_lsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig");

if not mason_lsp_status_ok or mason_lspconfig == nil then
  vim.notify [[failed to load mason-lspconfig.]]
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "bashls",
  "clangd",
  "cssls",
  "html",
  "jsonls",
  "lua_ls",
  "tsserver",
  "pylsp"
}

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  }
}

mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = false,
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("core.lsp.handlers").on_attach,
    capabilities = require("core.lsp.handlers").capabilities,
  }

  local has_opts, server_opts = pcall(require, "core.lsp.settings." .. server)
  if has_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  lspconfig[server].setup(opts)
end
