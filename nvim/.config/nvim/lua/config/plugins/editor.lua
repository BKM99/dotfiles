return {
	-- {
	-- 	"echasnovski/mini.files",
	-- 	opts = {
	-- 		windows = {
	-- 			preview = false,
	-- 			width_focus = 30,
	-- 			width_preview = 30,
	-- 		},
	-- 		options = {
	-- 			use_as_default_explorer = false,
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>e",
	-- 			function()
	-- 				require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
	-- 			end,
	-- 			desc = "Open mini.files (Directory of Current File)",
	-- 		},
	-- 		{
	-- 			"-",
	-- 			function()
	-- 				require("mini.files").open(vim.uv.cwd(), true)
	-- 			end,
	-- 			desc = "Open mini.files (cwd)",
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("mini.files").setup(opts)

	-- 		local show_dotfiles = true
	-- 		local filter_show = function(fs_entry)
	-- 			return true
	-- 		end
	-- 		local filter_hide = function(fs_entry)
	-- 			return not vim.startswith(fs_entry.name, ".")
	-- 		end

	-- 		local toggle_dotfiles = function()
	-- 			show_dotfiles = not show_dotfiles
	-- 			local new_filter = show_dotfiles and filter_show or filter_hide
	-- 			require("mini.files").refresh({ content = { filter = new_filter } })
	-- 		end

	-- 		vim.api.nvim_create_autocmd("User", {
	-- 			pattern = "MiniFilesBufferCreate",
	-- 			callback = function(args)
	-- 				local buf_id = args.data.buf_id
	-- 				vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle Hidden Files" })
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"stevearc/oil.nvim",
		keys = {
			{
				"<leader>e",
				function()
					require("oil").toggle_float()
				end,
				desc = "Toggle Oil",
			},
		},
		opts = {
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
			default_file_explorer = true,
			columns = {
				-- "icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			view_options = {
				show_hidden = true,
			},
		},
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{ "<leader>S", "<cmd>Spectre<cr>", "[S]earch and [R]eplace (Spectre)" },
		},
	},
	{

		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function(_, opts)
			local gitsigns = require("gitsigns")
			gitsigns.setup(opts)
			local keymap = vim.keymap.set
			keymap("n", "<leader>bl", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git blame line" })
			keymap("n", "]h", gitsigns.next_hunk, { desc = "Next Hunk" })
			keymap("n", "[h", gitsigns.prev_hunk, { desc = "Prev Hunk" })
			keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", { desc = "Git Blame line" })
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Git Stage hunk" })
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
			keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Git Undo stage hunk" })
			keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Git diffthis" })
		end,
	},
	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = true,
			use_icons = false,
		},
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "[D]iffview [O]pen" },
			{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "[D]iffview [C]lose" },
			{ "<leader>dr", "<cmd>DiffviewRefresh<cr>", desc = "[D]iffview [R]efresh" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[D]iffview [F]ileHistory" },
		},
	},
	{ "tpope/vim-fugitive" },
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	keys = {
	-- 		{ "<leader>go", "<cmd>Neogit<cr>", desc = "Open Neogit" },
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"sindrets/diffview.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	config = true,
	-- },
}
