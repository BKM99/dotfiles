return {
	{
		"folke/trouble.nvim",
		opts = { icons = false, use_diagnostic_signs = true },
		config = function(_, opts)
			require("trouble").setup(opts)
			vim.keymap.set("n", "<leader>xx", function()
				require("trouble").toggle()
			end, { desc = "Trouble Toggle" })
			vim.keymap.set("n", "<leader>xw", function()
				require("trouble").toggle("workspace_diagnostics")
			end, { desc = "Trouble Toggle Workspace Diagnostics" })
			vim.keymap.set("n", "<leader>xd", function()
				require("trouble").toggle("document_diagnostics")
			end, { desc = "Trouble Toggle Document Diagnostics" })
			vim.keymap.set("n", "<leader>xq", function()
				require("trouble").toggle("quickfix")
			end, { desc = "Trouble Toggle Quickfix" })
			vim.keymap.set("n", "<leader>xl", function()
				require("trouble").toggle("loclist")
			end, { desc = "Trouble Toggle Location list" })
			vim.keymap.set("n", "gR", function()
				require("trouble").toggle("lsp_references")
			end, { desc = "Trouble Toggle LSP refs" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { adaptive_size = true },
			})
			vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTreeFindFile" })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
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
			require("oil").setup(opts)
			vim.keymap.set("n", "<leader>t", function()
				require("oil").toggle_float()
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
			require("spectre").setup(opts)
			vim.keymap.set("n", "<leader>S", function()
				require("spectre").open()
			end, { desc = "[S]earch and [R]eplace (Spectre)" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function(_, opts)
			local gitsigns = require("gitsigns")
			gitsigns.setup(opts)
			vim.keymap.set("n", "<leader>bl", function()
				gitsigns.blame_line({ full = false })
			end, { desc = "Git blame line" })

			vim.keymap.set("n", "]h", gitsigns.next_hunk, { desc = "Next Hunk" })
			vim.keymap.set("n", "[h", gitsigns.prev_hunk, { desc = "Prev Hunk" })
		end,
	},
	{
		"sindrets/diffview.nvim",
		opts = { use_icons = false },
		config = function(_, opts)
			require("diffview").setup(opts)
			vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "[D]iffview [O]pen" })
			vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "[D]iffview [C]lose" })
			vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<cr>", { desc = "[D]iffview [R]efresh" })
			vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "[D]iffview [F]ileHistory" })
		end,
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
			vim.keymap.set("n", "<leader>hm", function()
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
	{
		"NMAC427/guess-indent.nvim",
		opts = { auto_cmd = false },
		config = function(_, opts)
			require("guess-indent").setup(opts)
			vim.keymap.set("n", "<leader>gi", ":GuessIndent<cr>", { desc = "[G]uess [I]ndent" })
		end,
	},
}
