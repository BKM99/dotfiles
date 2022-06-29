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

    if server == "jdtls" then
        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end
