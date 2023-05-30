local status_ok, mason_registry = pcall(require, "mason-registry")
if not status_ok then
	vim.notify([[failed to load mason-registry]])
	return
end

local js_debug = mason_registry.get_package("js-debug-adapter")
local server_path = js_debug:get_install_path()

return {
	name = "pwa-node",
	adapter = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = { server_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
		},
	},
	configuration = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
		},
	},
}
