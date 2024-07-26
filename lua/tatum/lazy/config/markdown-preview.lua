local M = {
	mkdp_auto_start = 0,
	mkdp_auto_close = 1,
	mkdp_refresh_slow = 0,
	mkdp_command_for_global = 0,
	mkdp_open_to_the_world = 0,
	mkdp_open_ip = "",
	mkdp_browser = "",
	mkdp_echo_preview_url = 0,
	mkdp_port = "",
	mkdp_filetypes = { "markdown" },
	mkdp_theme = "dark",
	mkdp_combine_preview = 0,
	mkdp_combine_preview_auto_refresh = 1,
}

vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'relative',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

for key, val in pairs(M) do
	vim.g[key] = val
end
