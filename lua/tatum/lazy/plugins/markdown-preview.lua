return {
		"iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		-- config = function()
		-- 	vim.g.mkdp_browser = "qutebrowser"
		-- end,
		ft = { "markdown" }
	}
