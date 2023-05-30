local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	vim.notify([[failed to load nvim-dap]])
	return
end

local daps_status_ok, daps = pcall(require, "core.dap")
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

vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)

-- utility functions
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

-- Customer Lua Keybindings
vim.keymap.set("n", "<leader>dw", dap_clear_breakpoints)
vim.keymap.set("n", "<leader>dq", dap_terminate)
