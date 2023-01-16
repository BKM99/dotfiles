return {
    { "mfussenegger/nvim-jdtls", ft = "java" },
    { "b0o/SchemaStore.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end },
}
