return {
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{
	-- 			"Saecki/crates.nvim",
	-- 			event = { "BufRead Cargo.toml" },
	-- 			opts = {
	-- 				src = {
	-- 					cmp = { enabled = true },
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	opts = function(_, opts)
	-- 		opts.sources = opts.sources or {}
	-- 		table.insert(opts.sources, { name = "crates" })
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "codelldb", "rust-analyzer" })
			end
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},
}
