local status_ok, mason_registry = pcall(require, "mason-registry")
if not status_ok then
	vim.notify([[failed to load mason-registry]])
	return
end

local js_debug = mason_registry.get_package("netcoredbg")
local server_path = js_debug:get_install_path()

return {
  name = "coreclr",
adapter = {
  type = 'executable',
  command = server_path .. '/netcoredbg',
  args = {'--interpreter=vscode'}
},
configuration = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
}
