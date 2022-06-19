local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
    return
end

local dap_virtual_text_status_ok, dap_virutal_text = pcall(require, "nvim-dap-virutal-text")
if not dap_virtual_text_status_ok then
    return
end

dap_virutal_text.setup()

dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}

dapui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
