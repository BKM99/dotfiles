return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",

			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps && npm run compile",
				version = "v1.74.1",
			},
		},
		config = function()
			require("config.dap")
		end,
	},
	{
		"nvim-neotest/neotest",
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

			require("neotest").setup({
				adapters = {
					require("neotest-python"),
					require("neotest-go"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						-- jestCommand = "jest --watch ",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(_)
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-rust"),
				},
			})

			-- keymaps
			vim.keymap.set("n", "<leader>tn", function()
				require("neotest").run.run()
			end, { desc = "test nearest" })
			vim.keymap.set("n", "<leader>tf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "test entire file" })
			vim.keymap.set("n", "<leader>td", function()
				require("neotest").run.run({ strategy = "dap" })
			end, { desc = "debug test using dap" })
			vim.keymap.set("n", "<leader>tx", function()
				require("neotest").run.stop()
			end, { desc = "stop test" })
			vim.keymap.set("n", "<leader>ta", function()
				require("neotest").run.attach()
			end, { desc = "test attach" })
			vim.keymap.set("n", "<leader>to", require("neotest").output.open, { desc = "open test output" })
			vim.keymap.set("n", "<leader>ts", require("neotest").summary.open, { desc = "open test summary" })
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
			"rouge8/neotest-rust",
			{
				"nvim-neotest/neotest-vim-test",
				dependencies = { "vim-test/vim-test" },
			},
		},
	},
}
