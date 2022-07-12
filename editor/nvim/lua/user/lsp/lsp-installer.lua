local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "jsonls",
    "sumneko_lua",
    "clangd",
    "tsserver",
    "gopls",
    "html",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "bashls",
    "yamlls",
    "cssls",
    "eslint",
    "emmet_ls",
    "jdtls"
}

lsp_installer.setup {
    ensure_installed = servers
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.lsp-functions").on_attach,
        capabilities = require("user.lsp.lsp-functions").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = require "user.lsp.lsp-custom-server.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "user.lsp.lsp-custom-server.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "jdtls" then
        goto continue
    end

    if server == "rust_analyzer" then
        local keymap = vim.keymap.set
        local key_opts = { silent = true }

        keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
        keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
        keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
        keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
        keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
        keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
        keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
        keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
        keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
        keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
        keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
        keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
        keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
        keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
        keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
        keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
        keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
        keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

        require("rust-tools").setup {
            server = {
                on_attach = require("user.lsp.lsp-functions").on_attach,
                capabilities = require("user.lsp.lsp-functions").capabilities,
            },
        }

        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
