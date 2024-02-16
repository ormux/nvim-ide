local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify([[failed to load treesitter]])
	return
end

treesitter.setup({
  modules = {},
  ignore_install = {},
	ensure_installed = { "c", "cpp", "lua", "javascript", "typescript", "html" },
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
    use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ii"] = "@conditional.inner",
				["ai"] = "@conditional.outer",
				["il"] = "@loop.inner",
				["al"] = "@loop.outer",
				["at"] = "@comment.outer",
			},
			selection_modes = {
				["@function.outer"] = "v", -- linewise
				["@function.inner"] = "v", -- linewise
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
			-- goto_next = {
			--   [']i'] = "@conditional.inner",
			-- },
			-- goto_previous = {
			--   ['[i'] = "@conditional.inner",
			-- }
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})
