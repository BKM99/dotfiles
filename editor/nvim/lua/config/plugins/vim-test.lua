vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })
-- vim.cmd([[let test#strategy = "neovim"]])
