local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Documents/Neorg/Notes/",
				},
			},
		},
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c" },
		branch = "main",
	},
}
