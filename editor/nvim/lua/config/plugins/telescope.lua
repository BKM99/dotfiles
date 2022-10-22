local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				-- ["<C-h>"] = "which_key"
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
		},
	},
	file_ignore_patterns = { "node_modules" },
})

telescope.load_extension("fzf")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>gf", ":Telescope git_files theme=ivy <CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files hidden=true theme=ivy <CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep theme=ivy <CR>", opts)
keymap("n", "<leader>gb", ":Telescope current_buffer_fuzzy_find theme=ivy <CR>", opts)
keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)
keymap("n", "<leader>ht", ":Telescope help_tags theme=ivy <CR>", opts)
