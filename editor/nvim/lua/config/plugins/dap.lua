return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "mfussenegger/nvim-dap-python",
            "leoluz/nvim-dap-go",
            "mxsdev/nvim-dap-vscode-js",

            {
                "microsoft/vscode-js-debug",
                build = "npm install --legacy-peer-deps && npm run compile",
                version = "v1.74.1",
            },
        },
        config = function()
            require("config.dap")
        end,
    },
}
