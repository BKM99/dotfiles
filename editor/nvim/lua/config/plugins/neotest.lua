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
			"<leader>nf",
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
		{
			"<leader>no",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Open test output",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		{ "nvim-neotest/neotest-vim-test", dependencies = { "vim-test/vim-test" } },
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vim-test")({ ignore_file_types = { "python" } }),
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(_)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
