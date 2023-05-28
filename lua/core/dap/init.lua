local M = {}

M.setup = function(dap)
	local languages = {
		"javascript",
    "cs"
	}
	for _, language in pairs(languages) do
		local has_debugger,debugger = pcall(require, "core.dap.adapters.".. language)

		if has_debugger then
			dap.adapters[debugger.name] = debugger.adapter
			dap.configurations[language] = debugger.configuration
		end
	end
end

return M
