local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins_status_ok, plugins = pcall(require, "core.plugins")
if not plugins_status_ok then
	vim.notify([[failed to load plugins.lua]])
	return
end

local lazy_status_ok, lazy = pcall(require, "lazy")
if not lazy_status_ok then
	vim.notify([[failed to load lazy.nvim]])
	return
end
lazy.setup(plugins, { defaults = { lazy = false } })
