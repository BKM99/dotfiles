return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
			{ "windwp/nvim-ts-autotag" },
		},
		config = function()
			-- pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"css",
					"c_sharp",
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
					"vimdoc",
				},
				highlight = {
					enable = true,
					-- disable highlight for large files
					disable = function(_, buf)
						return vim.api.nvim_buf_line_count(buf) > 5000
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autopairs = { enable = true },
				context_commentstring = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
}
