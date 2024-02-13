return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				config = function()
					vim.g.skip_ts_context_commentstring_module = true
				end,
			},
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
						return vim.api.nvim_buf_line_count(buf) > 3500
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autotag = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]a"] = "@parameter.inner",
							["]b"] = "@block.outer",
							["]l"] = "@loop.outer",
							["]i"] = "@conditional.outer",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]A"] = "@parameter.inner",
							["]B"] = "@block.outer",
							["]L"] = "@loop.outer",
							["]I"] = "@conditional.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[a"] = "@parameter.inner",
							["[b"] = "@block.outer",
							["[l"] = "@loop.outer",
							["[i"] = "@conditional.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
							["[A"] = "@parameter.inner",
							["[B"] = "@block.outer",
							["[L"] = "@loop.outer",
							["[I"] = "@conditional.outer",
						},
					},
				},
			})
		end,
	},
}
