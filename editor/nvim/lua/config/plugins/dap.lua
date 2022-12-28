local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

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

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
    return
end

-- NOTE: create a virtual environment and install debugpy
-- the virutal environment does not need to be active, just point to the install location
-- I liked having one python virtual environment specifically for Neovim
dap_python.setup("~/.pyenv/versions/py3nvim/bin/python", {})

local status_ok_js_debug, dap_vscode_js = pcall(require, "dap-vscode-js")
if not status_ok_js_debug then
    return
end

local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

dap_vscode_js.setup({
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "[pwa-node] Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "[pwa-node] Attach",
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

for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:3000",
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
