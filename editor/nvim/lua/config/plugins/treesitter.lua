return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
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
					-- "markdown",
					-- "markdown_inline",
					"python",
					"rust",
					"ruby",
					"toml",
					"vim",
					"yaml",
					-- "help",
					-- "elixir",
				},
				highlight = {
					enable = true,
					-- disable highlight for large files
					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "yaml", "rust", "python" },
				},
				-- autopairs = {
				-- 	enable = true,
				-- },
				-- matchup = {
				-- 	enable = true,
				-- },
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
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
