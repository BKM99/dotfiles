local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

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
    "yamlls",
    "cssls",
    "eslint",
    "jdtls",
}

mason_lspconfig.setup({
    ensure_installed = servers,
})

local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status_ok then
    return
end

-- I'm using this tool for everything that's not an LSP
mason_tool_installer.setup({
    ensure_installed = {
        "js-debug-adapter",
        "delve",
        "black",
        "flake8",
        "prettierd",
        "stylua",
        "codelldb",
        "java-debug-adapter",
        "java-test",
        "gofumpt",
        "goimports",
    },
    auto_update = true,
    run_on_start = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- set border for lsp windows
require("lspconfig.ui.windows").default_options.border = "single"

local config = {
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local on_attach = require("config.plugins.lsp-utils").on_attach
local capabilities = require("config.plugins.lsp-utils").capabilities

lspconfig["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                },
            },
        },
    },
})

lspconfig["sumneko_lua"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

lspconfig["tsserver"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["eslint"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["tailwindcss"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("tailwind.config.js"),
})

lspconfig["jsonls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        provideFormatter = false,
    },
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
        },
    },
    setup = {
        commands = {},
    },
})

lspconfig["yamlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["clangd"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["html"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig["cssls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
