local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local status_ok_dap_vscode_js, dap_vscode_js = pcall(require, "dap-vscode-js")
if not status_ok_dap_vscode_js then
	return
end

dap_vscode_js.setup({
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
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
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Mocha Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/mocha/bin/mocha.js",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

-- dap.adapters.node2 = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
-- }

-- dap.configurations.javascript = {
-- 	{
-- 		name = "Launch",
-- 		type = "node2",
-- 		request = "launch",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		console = "integratedTerminal",
-- 	},
-- 	{
-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
-- 		name = "Attach to process",
-- 		type = "node2",
-- 		request = "attach",
-- 		processId = require("dap.utils").pick_process,
-- 	},
-- }

-- dap.configurations.typescript = {
-- 	{
-- 		name = "ts-node (Node2 with ts-node)",
-- 		type = "node2",
-- 		request = "launch",
-- 		cwd = vim.loop.cwd(),
-- 		runtimeArgs = { "-r", "ts-node/register" },
-- 		runtimeExecutable = "node",
-- 		args = { "--inspect", "${file}" },
-- 		sourceMaps = true,
-- 		skipFiles = { "<node_internals>/**", "node_modules/**" },
-- 	},
-- 	{
-- 		name = "Jest (Node2 with ts-node)",
-- 		type = "node2",
-- 		request = "launch",
-- 		cwd = vim.loop.cwd(),
-- 		runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
-- 		runtimeExecutable = "node",
-- 		args = { "${file}", "--runInBand", "--coverage", "false" },
-- 		sourceMaps = true,
-- 		port = 9229,
-- 		skipFiles = { "<node_internals>/**", "node_modules/**" },
-- 	},
-- }

-- dap.adapters.chrome = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
-- }

-- dap.configurations.javascriptreact = { -- change this to javascript if needed
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }

-- dap.configurations.typescriptreact = { -- change to typescript if needed
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }
