local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	change_detection = { notify = false },
	spec = {
		{ import = "config.plugins.colorscheme" },
		{ import = "config.plugins.treesitter" },
		{ import = "config.plugins.lspconfig" },
		{ import = "config.plugins.misc" },
		{ import = "config.plugins.telescope" },
		{ import = "config.plugins.coding" },
		{ import = "config.plugins.editor" },
		{ import = "config.plugins.format" },
		{ import = "config.plugins.dap" },
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tohtml",
				"tutor",
			},
		},
	},
})
