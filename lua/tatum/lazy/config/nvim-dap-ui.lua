local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	vim.notify([[failed to load nvim-dap]])
	return
end

local daps_status_ok, daps = pcall(require, "tatum.lazy.config.dap")
if not daps_status_ok then
	vim.notify([[failed to configure adapters]])
	return
end

daps.setup(dap)

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	vim.notify([[failed to load nvim-dapui]])
	return
end

dapui.setup()

-- https://github.com/rcarriga/nvim-dap-ui#usage
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- https://github.com/mfussenegger/nvim-dap/discussions/355#discussioncomment-4398846
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#FF4444", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapBreakpointRejected", { ctermbg = 0, fg = "#FF0000", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapBreakpointCondition", { ctermbg = 0, fg = "#8316f7", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "●", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapBreakpointCondition", {
	text = "●",
	texthl = "DapBreakpointCondition",
	linehl = "DapBreakpointCondition",
	numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "DapBreakpointRejected",
	linehl = "DapBreakpointRejected",
	numhl = "DapBreakpointRejected",
})
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- Utility functions
local function dap_clear_breakpoints()
	dap.clear_breakpoints()
	vim.notify([[Breakpoints cleared]], "warn")
end

local function dap_terminate()
	dap.clear_breakpoints()
	dap.terminate({}, { terminateDebuggee = true }, function()
		vim.notify("Debugger session ended", "warn")
	end)
end

-- DAP Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local widgets = require("dap.ui.widgets")

keymap("n", "<leader>db", dap.toggle_breakpoint, opts)
keymap("n", "<leader>dc", dap.continue, opts)
keymap("n", "<leader>dv", dap.step_over, opts)
keymap("n", "<leader>di", dap.step_into, opts)
keymap("n", "<leader>do", dap.step_out, opts)
keymap("n", "<leader>dw", dap_clear_breakpoints, opts)
keymap("n", "<leader>dq", dap_terminate, opts)
keymap("n", "<Leader>dp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)
keymap("n", "<Leader>dr", dap.repl.open, opts)
keymap("n", "<Leader>dl", dap.run_last, opts)
keymap({ "n", "v" }, "<Leader>dh", widgets.hover, opts)
keymap({ "n", "v" }, "<Leader>dp", widgets.preview, opts)
keymap("n", "<Leader>df", function()
	widgets.centered_float(widgets.frames)
end, opts)
keymap("n", "<Leader>ds", function()
	widgets.centered_float(widgets.scopes)
end, opts)
