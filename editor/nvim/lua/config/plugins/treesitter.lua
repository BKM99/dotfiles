return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            -- pcall(require("nvim-treesitter.install").update({ with_sync = true }))
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "css",
                    "go",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "lua",
                    "typescript",
                    "tsx",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "rust",
                    "ruby",
                    "toml",
                    "vim",
                    "yaml",
                    "help",
                },
                highlight = {
                    enable = true,
                    -- disable highlight for large files
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                autopairs = {
                    enable = true,
                },
                matchup = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                },
            })
        end,
    },
}
