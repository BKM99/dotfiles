require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,      -- false will disable the whole extension
        additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true -- This is for autotag plugin
    }
}
