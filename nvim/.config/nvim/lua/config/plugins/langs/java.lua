return {
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = function(_, opts)
	-- 		if type(opts.ensure_installed) == "table" then
	-- 			vim.list_extend(opts.ensure_installed, { "java" })
	-- 		end
	-- 	end,
	-- },
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	ft = "java",
	-- 	config = false,
	-- 	dependencies = {
	-- 		{
	-- 			"neovim/nvim-lspconfig",
	-- 			opts = {
	-- 				servers = {
	-- 					jdtls = {},
	-- 				},
	-- 				setup = {
	-- 					jdtls = function()
	-- 						require("java").setup({})
	-- 					end,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
