local status_ok, obsidian = pcall(require, "obsidian")

if not status_ok then
	vim.notify([[failed to load obsidian.]])
	return
end

obsidian.setup({
  disable_frontmatter = true,
  ui = {
    enable = false,
  },
	workspaces = {
		{
			name = "Computer Science",
			path = "~/Obsidian/Computer Science",
		},
		{
			name = "Artificial Intelligence",
			path = "~/Obsidian/Artificial Intelligence",
		},
	},
  templates = {
    folder = "ObsidianTemplates",
    date_format = "%Y-%m-%d %a",
    time_format = "%H:%M"
  },
})
