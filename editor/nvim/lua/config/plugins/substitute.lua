local ok, substitute = pcall(require, "substitute")
if not ok then
	return
end

substitute.setup()

vim.keymap.set("n", "t", "<cmd>lua require('substitute').operator({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("n", "tt", "<cmd>lua require('substitute').line({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("n", "T", "<cmd>lua require('substitute').eol({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("x", "t", "<cmd>lua require('substitute').visual({ register = '*' })<cr>", { noremap = true })

vim.keymap.set("n", "tx", "<cmd>lua require('substitute.exchange').operator({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("n", "txx", "<cmd>lua require('substitute.exchange').line({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual({ register = '*' })<cr>", { noremap = true })
vim.keymap.set("n", "txc", "<cmd>lua require('substitute.exchange').cancel({ register = '*' })<cr>", { noremap = true })
