return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
				desc = "DAP set breakpoint",
			},
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
			{
				"<S-up>",
				"<cmd>lua require'dap'.continue()<cr>",
				desc = "DAP continue",
			},
			{
				"<S-right>",
				"<cmd>lua require'dap'.step_into()<cr>",
				desc = "DAP step into",
			},
			{
				"<S-left>",
				"<cmd>lua require'dap'.step_over()<cr>",
				desc = "DAP step over",
			},
			{
				"<S-down>",
				"<cmd>lua require'dap'.step_out()<cr>",
				desc = "DAP step out",
			},
			{
				"<leader>dr",
				"<cmd>lua require'dap'.repl.toggle()<cr>",
				desc = "DAP REPL toggle",
			},
			{
				"<leader>dl",
				"<cmd>lua require'dap'.run_last()<cr>",
				desc = "DAP run last",
			},
			{
				"<leader>dt",
				"<cmd>lua require'dap'.terminate()<cr>",
				desc = "DAP terminate",
			},
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

			--[[
				debug js and ts like this:

				--inspect-brk will wait for client to attach first before running the code

				node --inspect --require ts-node/register file.ts
				node --inspect-brk --require ts-node/register file.ts

				node --inspect file.js
				node --inspect-brk file.js

				then attach to it

				can visit Chrome://Inspect to debug via chrome dev tools
			]]

			local dap = require("dap")

			if not dap.adapters["pwa-node"] then
				require("dap").adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							require("mason-registry").get_package("js-debug-adapter"):get_install_path()
								.. "/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}
			end
			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "[node] Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "[node] Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest Tests",
						-- trace = true, -- include debugger info
						runtimeExecutable = "node",
						runtimeArgs = {
							"./node_modules/jest/bin/jest.js",
							"--runInBand",
						},
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
				}
			end

			dap.adapters.lldb = {
				type = "executable",
				-- NOTE: installed llvm with brew to get lldb-vscode binary
				command = "/opt/homebrew/Cellar/llvm/16.0.3/bin/lldb-vscode", -- adjust as needed, must be absolute path
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,

		dependencies = {
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
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					local path = require("mason-registry").get_package("debugpy"):get_install_path()
					require("dap-python").setup(path .. "/venv/bin/python")
				end,
			},
			{
				"leoluz/nvim-dap-go",
				config = function()
					require("dap-go").setup({
						delve = {
							path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/dlv",
						},
					})
				end,
			},
		},
	},
}
