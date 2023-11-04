local M = {}

M.use_plugins = function(enable_plugins)
	if enable_plugins then
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
				{ import = "config.plugins.mason" },
				{ import = "config.plugins.lsp.setup" },
				{ import = "config.plugins.dap" },
				{ import = "config.plugins.cmp" },
				{ import = "config.plugins.treesitter" },
				{ import = "config.plugins.colorscheme" },
				{ import = "config.plugins.telescope" },
				{ import = "config.plugins.misc" },
				{ import = "config.plugins.format" },
				{ import = "config.plugins.lint" },
			},
		})
	end
end

return M