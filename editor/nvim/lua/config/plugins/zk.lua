local status_ok, zk = pcall(require, "zk")
if not status_ok then
	return
end

zk.setup({
	-- can be "telescope", "fzf" or "select" (`vim.ui.select`)
	-- it's recommended to use "telescope" or "fzf"
	picker = "telescope",

	lsp = {
		-- `config` is passed to `vim.lsp.start_client(config)`
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start_client()`
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
			filetypes = { "markdown", "vimwiki" },
		},
	},
})


local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- ZK
keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
keymap("n", "<leader>znl", "<Cmd>ZkNew { title = vim.fn.input('Title: '), group = 'leetcode', dir = 'leetcode/'}<CR>", opts)
keymap("n", "<leader>znd", "<Cmd>ZkNew { group = 'daily', dir = 'daily/'}<CR>", opts)
keymap("n", "<leader>zf", "<cmd>ZkNotes <cr>", opts)
keymap("n", "<leader>zt", "<cmd>ZkTags <cr>", opts)
