return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
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
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
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
					},
				},
			})
		end,
	},
}
