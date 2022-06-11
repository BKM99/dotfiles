require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,      -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true -- This is for autotag plugin
    },
    autopairs = {
        enable = true
    },
    indent = { enable = true, disable = { "yaml", "python", "rust" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
        disable = {},  -- optional, list of language that will be disabled
        -- [options]
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
