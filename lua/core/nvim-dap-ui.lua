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
