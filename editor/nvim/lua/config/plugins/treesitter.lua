return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { { "JoosepAlviste/nvim-ts-context-commentstring" }, { "windwp/nvim-ts-autotag" } },
		config = function()
			-- pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"typescript",
					"tsx",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"ruby",
					"toml",
					"vim",
					"yaml",
					"help",
				},
				highlight = {
					enable = true,
					-- disable highlight for large files
					disable = function(_, buf)
						return vim.api.nvim_buf_line_count(buf) > 2000
					end,
					additional_vim_regex_highlighting = false,
				},
				autopairs = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				matchup = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
				},
			})
		end,
	},
}
