local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify [[failed to load nvim-lsp-installer]]
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "sumneko_lua",
  "tsserver"
}

lsp_installer.setup {
  ensure_installed = servers,
  ui = {
    icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
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
  },
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
