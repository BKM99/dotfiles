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
	spec = {
		{ import = "config.plugins" },
		-- { import = "config.plugins.dap" },
		-- { import = "config.plugins.lsp" },
		-- { import = "config.plugins.cmp" },
		-- { import = "config.plugins.colorscheme" },
		-- { import = "config.plugins.comment" },
		-- { import = "config.plugins.git" },
		-- { import = "config.plugins.misc" },
		-- { import = "config.plugins.neotest" },
		-- { import = "config.plugins.telescope" },
		-- { import = "config.plugins.treesitter" },
		-- { import = "config.plugins.ui" },
	},
}, {
	ui = {
		border = "rounded",
	},
})

vim.keymap.set("n", "<leader>L", ":Lazy<cr>")
