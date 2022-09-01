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
		disable = { "yaml", "python", "rust" },
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
})
