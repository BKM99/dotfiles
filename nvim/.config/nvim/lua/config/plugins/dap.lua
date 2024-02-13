return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "DAP set breakpoint" },
			{ "<S-up>", "<cmd>lua require'dap'.continue()<cr>", desc = "DAP continue" },
			{ "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", desc = "DAP step into" },
			{ "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", desc = "DAP step over" },
			{ "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", desc = "DAP step out" },
			{ "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "DAP terminate" },
		},

		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })

			local load_launchjs = function()
				require("dap.ext.vscode").load_launchjs()
			end
			if not pcall(load_launchjs) then
				print("Failed to parse launch.json.")
			end

			local dap = require("dap")
		end,

		dependencies = {
			{ "williamboman/mason.nvim" },
			{
				"rcarriga/nvim-dap-ui",
                -- stylua: ignore
                keys = {
                    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "DAP UI toggle" },
                    { "<leader>de", function() require("dapui").eval() end, desc = "Eval",         mode = { "n", "v" }, },
                },
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup({
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
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					require("dap-python").setup(
						require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
					)
				end,
			},
			{
				"leoluz/nvim-dap-go",
				config = function()
					require("dap-go").setup({
						delve = {
							path = require("mason-registry").get_package("delve"):get_install_path() .. "/dlv",
						},
					})
				end,
			},
		},
	},
}
