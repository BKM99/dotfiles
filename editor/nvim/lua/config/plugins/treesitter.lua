return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
					"c_sharp",
					"go",
					"java",
					"javascript",
					"lua",
					"typescript",
					"tsx",
					"python",
					"rust",
					"toml",
					"vim",
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
				context_commentstring = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
}
