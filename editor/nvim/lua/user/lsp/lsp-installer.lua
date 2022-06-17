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
    "jdtls"
}

lsp_installer.setup {
    ensure_installed = servers
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- Custom settings for sumneko_lua
local sumneko_lua_opts = {
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
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.lsp-functions").on_attach,
        capabilities = require("user.lsp.lsp-functions").capabilities
    }

    if server == "sumneko_lua" then
        opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
    end

    lspconfig[server].setup(opts)
end
