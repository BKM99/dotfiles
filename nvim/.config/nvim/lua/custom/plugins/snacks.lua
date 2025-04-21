return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {},
			explorer = {},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>,",  function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>nt", function() Snacks.explorer() end,                                       desc = "File Explorer" },
			-- find
			{ "<leader>f",  function() Snacks.picker.files() end,                                   desc = "Find Files" },
			{ "<leader>sc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>sg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
			-- search
			{ "<leader>sC", function() Snacks.picker.commands() end,                                desc = "Commands" },
			{ "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
			{ "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
			{ "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
			{ "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
			{ "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
			{ "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
		},
	},
}
