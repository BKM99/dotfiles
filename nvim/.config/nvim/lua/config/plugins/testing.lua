-- plugins that i am trying out
return {
	{
		"ggandor/leap.nvim",
		enabled = true,
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				show_buffer_icons = false,
				diagnostics = "nvim_lsp",
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- {
	-- 	"echasnovski/mini.ai",
	-- 	event = "VeryLazy",
	-- 	opts = function()
	-- 		local ai = require("mini.ai")
	-- 		return {
	-- 			n_lines = 500,
	-- 			custom_textobjects = {
	-- 				o = ai.gen_spec.treesitter({ -- code block
	-- 					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
	-- 					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
	-- 				}),
	-- 				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
	-- 				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
	-- 				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
	-- 				d = { "%f[%d]%d+" }, -- digits
	-- 				e = { -- Word with case
	-- 					{
	-- 						"%u[%l%d]+%f[^%l%d]",
	-- 						"%f[%S][%l%d]+%f[^%l%d]",
	-- 						"%f[%P][%l%d]+%f[^%l%d]",
	-- 						"^[%l%d]+%f[^%l%d]",
	-- 					},
	-- 					"^().*()$",
	-- 				},
	-- 				u = ai.gen_spec.function_call(), -- u for "Usage"
	-- 				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
	-- 			},
	-- 		}
	-- 	end,
	-- },
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
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
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
			vim.keymap.set("n", "<leader>6", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>7", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>8", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<leader>9", function()
				harpoon:list():select(5)
			end)
		end,
	},
}
