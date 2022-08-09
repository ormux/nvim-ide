local M = {}

-- BEGIN SETUP
function M.setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = "" }
    )
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  -- :help vim.diagnositic.config()
  vim.diagnostic.config(config)

  -- :help lsp-handler-configuration
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

-- END SETUP

-- BEGIN LSP Keymaps
-- bufnr = buffer handle number
local function lsp_keymaps(bufnr)
  local defopts = { noremap = true, silent = true }
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- different from nvim_buf_set_keymap, it maps to lua functions
  local keymap = vim.keymap.set -- :help lua-keymap

  keymap("n", "[d", vim.diagnostic.goto_prev, defopts)
  keymap("n", "]d", vim.diagnostic.goto_next, defopts)
  keymap("n", "gl", vim.diagnostic.open_float, defopts)
  keymap("n", "<LocalLeader>q", vim.diagnostic.setloclist, defopts)

  keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)

  keymap("n", "K", vim.lsp.buf.hover, bufopts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  -- :help user-commands
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])
end

-- END LSP Keymaps

function M.on_attach(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- https://github.com/hrsh7th/cmp-nvim-lsp
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  vim.notify "failed to load cmp_nvim_lsp."
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
