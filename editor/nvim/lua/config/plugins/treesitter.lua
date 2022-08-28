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
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true, -- This is for autotag plugin
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
	},
	playground = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
