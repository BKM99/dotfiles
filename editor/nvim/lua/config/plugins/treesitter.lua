local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
else
	configs.setup({
		ensure_installed = {
			"c",
			"c_sharp",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"lua",
			"typescript",
			"markdown",
			"tsx",
			"markdown",
			"markdown_inline",
			"norg",
			"python",
			"rust",
			"ruby",
			"sql",
			"toml",
			"vim",
			"yaml",
			"bash",
			"comment",
			"query",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { "yaml", "rust", "python" },
		},
		autotag = {
			enable = true,
		},
		autopairs = {
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
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
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
end
