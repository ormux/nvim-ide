local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify([[failed to load nvim-tree.]])
	return
end

nvim_tree.setup({
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- custom mappings
		vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	end,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		-- mappings = {
		-- 	list = {
		-- 		{ key = "u", action = "dir_up" },
		-- 	},
		-- },
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
