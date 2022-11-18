local ok, neotest = pcall(require, "neotest")
if not ok then
	return
end

local function setup_vim_test()
	vim.api.nvim_exec(
		[[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
        let g:test#echo_command = 1
    ]],
		false
	)
end

setup_vim_test()

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
keymap("n", "<leader>tA", "<cmd>lua require('neotest').run.run({ suite = true })<cr>", opts)
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "<leader>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", opts)
keymap("n", "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", opts)
keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", opts)
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", opts)
keymap("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap("n", "[n", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", opts)
keymap("n", "]n", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", opts)
