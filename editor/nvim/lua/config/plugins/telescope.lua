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
        { "nvim-lua/plenary.nvim" },
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
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set

        keymap("n", "<leader>f", ":Telescope find_files hidden=true theme=ivy <CR>", opts)
        keymap("n", "<leader>gs", ":Telescope git_status theme=ivy <CR>", opts)
        keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)
        keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
        keymap("n", "<leader>lg", ":Telescope live_grep <CR>", opts)
    end,
}
