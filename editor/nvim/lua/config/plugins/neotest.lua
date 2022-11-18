local ok, neotest = pcall(require, "neotest")
if not ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-vim-test"),
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
		require("neotest-go"),
		require("neotest-jest"),
		require("neotest-rust"),
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", opts)
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "<leader>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", opts)
keymap("n", "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", opts)
keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", opts)
keymap("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap("n", "<leader>tv", "<cmd>TestVisit<cr>", opts)
keymap("n", "<leader>tx", "<cmd>TestSuite<cr>", opts)
