local dap = require("dap")
local dapui = require("dapui")
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

keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dbc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
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

-- language specific dap setup
require("config.dap.python")
require("config.dap.javascript")
require("config.dap.rust")
require("config.dap.go")
require("config.dap.cpp")
