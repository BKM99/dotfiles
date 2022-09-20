local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Run the nearest test
keymap("n", "<leader>tn", ":lua require('neotest').run.run()<cr>", opts)
-- Run the current file
keymap("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
-- Neotest Summary
keymap("n", "<leader>tss", ":lua require('neotest').summary.toggle()<cr>", opts)
-- Stop Test
keymap("n", "<leader>tx", ":lua require('neotest').run.stop()<cr>", opts)
-- Debug nearest test
keymap("n", "<leader>tdn", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", opts)
-- Open Output
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", opts)


local M = {}

local function config_test()
	vim.api.nvim_exec(
		[[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1

        " Python
        let test#python#runner = 'pyunit'
        " let test#python#runner = 'pytest'

        " Javascript
        let test#javascript#reactscripts#options = "--watchAll=false"
        let g:test#javascript#runner = 'jest'
        let g:test#javascript#cypress#executable = 'npx cypress run-ct'

        " csharp
        let test#csharp#runner = 'dotnettest'
    ]],
		false
	)
end

function M.javascript_runner()
	local runners = { "cypress", "jest" }
	vim.ui.select(runners, { prompt = "Choose Javascript Runner" }, function(selected)
		if selected then
			vim.g["test#javascript#runner"] = selected
			require("utils").info("Test runner changed to " .. selected, "Test Runner")
		end
	end)
end

function M.setup()
	neotest.setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
				runner = "unittest",
			}),
			require("neotest-jest"),
			require("neotest-go"),
			require("neotest-vim-test")({
				ignore_file_types = { "python", "vim", "lua" },
			}),
			require("neotest-rust"),
		},
	})

	-- vim-test
	config_test()
end

return M
