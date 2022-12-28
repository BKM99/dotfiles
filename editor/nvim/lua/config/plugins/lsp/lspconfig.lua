local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status_ok then
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
    "elixirls",
}

mason_lspconfig.setup({
    ensure_installed = servers,
})

mason_tool_installer.setup({
    -- I'm using this tool for everything that's not an LSP
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

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("config.plugins.lsp.lsp-handlers").on_attach,
        capabilities = require("config.plugins.lsp.lsp-handlers").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = {
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
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = {
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
        }
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "jsonls" then
        local jsonls_opts = {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                },
            },
        }
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "tailwindcss" then
        local tailwindcss_opts = {
            root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
        }
        opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
    end

    if server == "jdtls" then
        goto continue
    end

    if server == "elixirls" then
        local elixirls_opts = {
            cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
            settings = {
                elixirLS = {
                    dialyzerEnabled = false,
                    fetchDeps = false,
                },
            },
        }

        opts = vim.tbl_deep_extend("force", elixirls_opts, opts)
    end

    lspconfig[server].setup(opts)
    ::continue::
end
