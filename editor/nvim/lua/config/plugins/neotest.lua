return {
	"nvim-neotest/neotest",
	keys = {
		{
			"<leader>nt",
			function()
				require("neotest").run.run()
			end,
			desc = "Test nearest",
		},
		{
			"<leader>nc",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Test current file",
		},
		{
			"<leader>nd",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug test",
		},
		{
			"<leader>ns",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop tests",
		},
		{
			"<leader>na",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach to test",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"mfussenegger/nvim-dap", -- needed for debugging test cases
		{ "nvim-neotest/neotest-vim-test", dependencies = { "vim-test/vim-test" } },
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vim-test")({ ignore_file_types = { "python" } }),
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})
	end,
}
