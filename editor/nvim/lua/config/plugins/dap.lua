local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local virutal_text_status_ok, virtual_text = pcall(require, "nvim-dap-virtual-text")
if not virutal_text_status_ok then
	return
end

virtual_text.setup()

local home = os.getenv("HOME")

dapui.setup({})

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

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
keymap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<S-up>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts) -- open and close
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
	return
end

dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dap_python.test_runner = "unittest"

local dap_go_status_ok, dap_go = pcall(require, "dap-go")
if not dap_go_status_ok then
	return
end

dap_go.setup()

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { home .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "~/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

dap.configurations.javascript = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescript = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			return "127.0.0.1"
		end,
		port = function()
			local val = 54231
			return val
		end,
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/Cellar/llvm/14.0.6_1/bin/lldb-vscode", -- brew install llvm
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.loop.cwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},
	},
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
