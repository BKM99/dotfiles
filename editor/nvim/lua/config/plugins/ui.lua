return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },

    {
        "mbbill/undotree",
        keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTreeToggle" } },
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
}
