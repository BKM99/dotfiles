-- TODO: consider redoing/refactoring DAP
return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "DAP set breakpoint" },
			{
				"<leader>dbc",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				desc = "DAP breakpoint condition",
			},
			{
				"<leader>dlp",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
				desc = "DAP logpoint message",
			},
			{ "<S-up>", "<cmd>lua require'dap'.continue()<cr>", desc = "DAP continue" },
			{ "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", desc = "DAP step into" },
			{ "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", desc = "DAP step over" },
			{ "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", desc = "DAP step out" },
			{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "DAP REPL toggle" },
			{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "DAP run last" },
			{ "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "DAP terminate" },
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
			-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

			local load_launchjs = function()
				require("dap.ext.vscode").load_launchjs()
			end

			if not pcall(load_launchjs) then
				print("Failed to parse launch.json.")
			end

			require("config.plugins.dap.go")
			require("config.plugins.dap.python")
			require("config.plugins.dap.typescript")
			require("config.plugins.dap.rust")
			require("config.plugins.dap.cpp")
		end,
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				keys = {
					{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "DAP UI toggle" },
					{
						"<leader>de",
						function()
							require("dapui").eval()
						end,
						desc = "Eval",
						mode = { "n", "v" },
					},
				},
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup({
						controls = {
							icons = {
								disconnect = "",
								pause = "",
								play = "",
								run_last = "",
								step_back = "",
								step_into = "",
								step_out = "",
								step_over = "",
								terminate = "",
							},
						},
						layouts = {
							{
								elements = {
									{
										id = "scopes",
										size = 0.25,
									},
									{
										id = "breakpoints",
										size = 0.25,
									},
									{
										id = "stacks",
										size = 0.25,
									},
									{
										id = "watches",
										size = 0.25,
									},
								},
								position = "right",
								size = 80,
							},
							{
								elements = {
									{
										id = "repl",
										size = 0.5,
									},
									{
										id = "console",
										size = 0.5,
									},
								},
								position = "bottom",
								size = 25,
							},
						},
					})
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup()
				end,
			},
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			{
				"mxsdev/nvim-dap-vscode-js",
				dependencies = {
					{
						"microsoft/vscode-js-debug",
						-- tag = "v1.78.0",
						lazy = true,
						build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
					},
				},
			},
		},
	},
}
