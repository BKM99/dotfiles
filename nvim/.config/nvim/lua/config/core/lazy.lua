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
		{ import = "config.plugins.editor" },
		{ import = "config.plugins.lsp" },
		{ import = "config.plugins.telescope" },
		{ import = "config.plugins.coding" },
		{ import = "config.plugins.dap" },
		-- { import = "config.plugins.neotest" },
		{ import = "config.plugins.testing" },
		{ import = "config.plugins.langs.lua" },
		{ import = "config.plugins.langs.go" },
		{ import = "config.plugins.langs.typescript" },
		{ import = "config.plugins.langs.python" },
		{ import = "config.plugins.langs.rust" },
		{ import = "config.plugins.langs.cpp" },
		{ import = "config.plugins.langs.csharp" },
		-- { import = "config.plugins.langs.java" },
		{ import = "config.plugins.langs.markdown" },
		{ import = "config.plugins.langs.docker" },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"man",
				"rplugin",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
