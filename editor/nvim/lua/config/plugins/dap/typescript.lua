local dap = require("dap")
local dap_utils = require("dap.utils")

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

for _, ext in ipairs(exts) do
	dap.configurations[ext] = {
		{
			name = "Launch Current File (pwa-node)",
			type = "pwa-node",
			request = "launch",
			cwd = vim.fn.getcwd(),
			args = { "${file}" },
			sourceMaps = true,
			protocol = "inspector",
		},
		{
			name = "Launch Current File (pwa-node with ts-node)",
			type = "pwa-node",
			request = "launch",
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
			name = "Launch Test Current File (pwa-node with jest)",
			type = "pwa-node",
			request = "launch",
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
			name = "Attach Program (pwa-chrome, select port)",
			type = "pwa-chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			port = function()
				return vim.fn.input("Select port: ", 9222)
			end,
			webRoot = "${workspaceFolder}",
		},
		{
			name = "Attach Program (pwa-node, select pid)",
			type = "pwa-node",
			request = "attach",
			cwd = vim.fn.getcwd(),
			processId = dap_utils.pick_process,
			skipFiles = { "<node_internals>/**" },
		},
	}
end

dap.configurations.javascriptreact = {
	{
		name = "chrome attach",
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

dap.configurations.typescriptreact = {
	{
		name = "chrome attach",
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
