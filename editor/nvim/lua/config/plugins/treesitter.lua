local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"python",
		"javascript",
		"java",
		"rust",
		"go",
		"lua",
		"json",
		"yaml",
		"toml",
		"html",
		"css",
		"bash",
		"vim",
		"tsx",
		"typescript",
		"cpp",
		"c",
		"c_sharp",
		"dockerfile",
		"markdown",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "yaml", "rust" },
	},
	context_commentstring = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- colors = {
		-- 	"Gold",
		-- 	"Orchid",
		-- 	"DodgerBlue",
		-- },
		disable = { "html" },
	},
	playground = {
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
