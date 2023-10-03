return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        -- { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                    ".venv/",
                },
            },
        })
        pcall(telescope.load_extension, "fzf")
        -- pcall(telescope.load_extension, "live_grep_args")
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set

        keymap("n", "<leader>f", ":Telescope find_files hidden=true theme=ivy <CR>", opts)
        keymap("n", "<leader>gs", ":Telescope git_status theme=ivy <CR>", opts)
        keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)
        keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
        keymap("n", "<leader>lg", ":Telescope live_grep theme=dropdown <CR>", opts)
        -- keymap(
        -- 	"n",
        -- 	"<leader>lg",
        -- 	":lua require('telescope').extensions.live_grep_args.live_grep_args() theme=dropdown<CR>",
        -- 	opts
        -- )
    end,
}
