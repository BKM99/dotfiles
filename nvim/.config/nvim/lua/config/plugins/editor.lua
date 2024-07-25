return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", {
				noremap = true,
			})

			vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFileToggle<CR>", {
				noremap = true,
			})
		end,
	},
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		opts = {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
			settings = {
				save_on_toggle = true,
			},
		},
		keys = function()
			local keys = {
				{
					"<leader>a",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Harpoon File",
				},
				{
					"<leader>he",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Harpoon Quick Menu",
				},
			}

			for i = 1, 9 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Harpoon to File " .. i,
				})
			end
			return keys
		end,
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
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",

			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
}
