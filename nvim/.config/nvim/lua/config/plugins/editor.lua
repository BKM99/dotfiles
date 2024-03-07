return {
	{
		"stevearc/oil.nvim",
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
		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)
			vim.keymap.set("n", "<leader>e", function()
				oil.toggle_float()
			end, { desc = "Toggle Oil" })
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = { open_cmd = "noswapfile vnew" },
		config = function(_, opts)
			local spectre = require("spectre")
			spectre.setup(opts)
			vim.keymap.set("n", "<leader>S", function()
				spectre.open()
			end, { desc = "[S]earch and [R]eplace (Spectre)" })
		end,
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
		config = function(_, opts)
			require("diffview").setup(opts)
			vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "[D]iffview [O]pen" })
			vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "[D]iffview [C]lose" })
			vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<cr>", { desc = "[D]iffview [R]efresh" })
			vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "[D]iffview [F]ileHistory" })
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<leader>he", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end)
		end,
	},
}
