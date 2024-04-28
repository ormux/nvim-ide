local status_ok, rest_nvim = pcall(require, "rest-nvim")

if not status_ok then
	vim.notify([[failed to load rest.nvim]])
end

local default_config = {
	client = "curl",
	env_file = ".env",
	env_pattern = "\\.env$",
	env_edit_command = "tabedit",
	encode_url = true,
	skip_ssl_verification = false,
	custom_dynamic_variables = {},
	logs = {
		level = "info",
		save = true,
	},
	result = {
		split = {
			horizontal = false,
			in_place = false,
			stay_in_current_window_after_split = true,
		},
		behavior = {
			decode_url = true,
			show_info = {
				url = true,
				headers = true,
				http_info = true,
				curl_command = true,
			},
			statistics = {
				enable = true,
				---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
				stats = {
					{ "total_time", title = "Time taken:" },
					{ "size_download_t", title = "Download size:" },
				},
			},
			formatters = {
				json = "jq",
				html = function(body)
					if vim.fn.executable("tidy") == 0 then
						return body, { found = false, name = "tidy" }
					end
					local fmt_body = vim.fn
						.system({
							"tidy",
							"-i",
							"-q",
							"--tidy-mark",
							"no",
							"--show-body-only",
							"auto",
							"--show-errors",
							"0",
							"--show-warnings",
							"0",
							"-",
						}, body)
						:gsub("\n$", "")
					return fmt_body, { found = true, name = "tidy" }
				end,
			},
		},
		keybinds = {
			buffer_local = true,
			prev = "H",
			next = "L",
		},
	},
	highlight = {
		enable = true,
		timeout = 750,
	},
	keybinds = {
		{ "<localleader>rs", "<CMD>Rest run<cr>", "Run request under the cursor" },
		{ "<localleader>rl", "<CMD>Rest run last<cr>", "Run request under the cursor" },
	},
}

rest_nvim.setup(default_config)

-- important noremap should not be used
-- local opts = { noremap = false, silent = true }
-- local keymap = vim.keymap.set

-- keymap("n", "<leader>rs", "<Plug>RestNvim", opts)
-- keymap("n", "<leader>rp", "<Plug>RestNvimPreview", opts)
-- keymap("n", "<leader>rl", "<Plug>RestNvimLast", opts)
