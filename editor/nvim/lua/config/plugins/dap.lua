return {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npm run compile",
		version = "v1.74.1",
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
            local dap_utils = require("dap.utils")
			require("nvim-dap-virtual-text").setup({})

			dapui.setup({})

			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
			-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			-- DAP Stuff
			keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
			keymap(
				"n",
				"<leader>dbc",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				opts
			)
			keymap(
				"n",
				"<leader>dlp",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
				opts
			)
			keymap("n", "<S-up>", "<cmd>lua require'dap'.continue()<cr>", opts)
			keymap("n", "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", opts)
			keymap("n", "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", opts)
			keymap("n", "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", opts)
			keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
			keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
			keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts) -- open and close
			keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

			local load_launchjs = function()
				require("dap.ext.vscode").load_launchjs()
			end

			if not pcall(load_launchjs) then
				print("Failed to parse launch.json.")
			end

			local dap_python_status_ok, dap_python = pcall(require, "dap-python")
			if not dap_python_status_ok then
				return
			end

			-- NOTE: create a virtual environment and install debugpy
			-- the virutal environment does not need to be active, just point to the install location
			-- I liked having one python virtual environment specifically for Neovim
			dap_python.setup("~/.pyenv/versions/py3nvim/bin/python", {})

			require("dap-vscode-js").setup({
				node_path = "node",
				debugger_path = os.getenv("HOME") .. "/.local/share/nvim/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			local exts = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				-- using pwa-chrome
				"vue",
				"svelte",
			}

			for i, ext in ipairs(exts) do
				dap.configurations[ext] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node)",
						cwd = vim.fn.getcwd(),
						args = { "${file}" },
						sourceMaps = true,
						protocol = "inspector",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node with ts-node)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "--loader", "ts-node/esm" },
						runtimeExecutable = "node",
						args = { "${file}" },
						sourceMaps = true,
						protocol = "inspector",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node with deno)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "run", "--inspect-brk", "--allow-all", "${file}" },
						runtimeExecutable = "deno",
						attachSimplePort = 9229,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Test Current File (pwa-node with jest)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
						runtimeExecutable = "node",
						args = { "${file}", "--coverage", "false" },
						rootPath = "${workspaceFolder}",
						sourceMaps = true,
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Test Current File (pwa-node with vitest)",
						cwd = vim.fn.getcwd(),
						program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
						args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
						autoAttachChildProcesses = true,
						smartStep = true,
						console = "integratedTerminal",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Test Current File (pwa-node with deno)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
						runtimeExecutable = "deno",
						attachSimplePort = 9229,
					},
					{
						type = "pwa-chrome",
						request = "attach",
						name = "Attach Program (pwa-chrome, select port)",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						port = function()
							return vim.fn.input("Select port: ", 9222)
						end,
						webRoot = "${workspaceFolder}",
					},
					-- {
					--   type = "node2",
					--   request = "attach",
					--   name = "Attach Program (Node2)",
					--   processId = dap_utils.pick_process,
					-- },
					-- {
					--   type = "node2",
					--   request = "attach",
					--   name = "Attach Program (Node2 with ts-node)",
					--   cwd = vim.fn.getcwd(),
					--   sourceMaps = true,
					--   skipFiles = { "<node_internals>/**" },
					--   port = 9229,
					-- },
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach Program (pwa-node, select pid)",
						cwd = vim.fn.getcwd(),
						processId = dap_utils.pick_process,
						skipFiles = { "<node_internals>/**" },
					},
				}
			end

			local dap_go_status_ok, dap_go = pcall(require, "dap-go")
			if not dap_go_status_ok then
				return
			end

			dap_go.setup()

			local install_root_dir = vim.fn.stdpath("data") .. "/mason"
			local extension_path = install_root_dir .. "/packages/codelldb/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
	},
}
