return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
				callback = function(event)
					-- local client = vim.lsp.get_client_by_id(event.data.client_id)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local vim_lsp_buf = vim.lsp.buf

					map("gd", vim_lsp_buf.definition, "[G]oto [D]efinition")
					map("gr", vim_lsp_buf.references, "[G]oto [R]eferences")
					map("gI", vim_lsp_buf.implementation, "[G]oto [I]mplementation")
					map("<leader>D", vim_lsp_buf.type_definition, "Type [D]efinition")
					map("gD", vim_lsp_buf.declaration, "[G]oto [D]eclaration")
					map("<leader>rn", vim_lsp_buf.rename, "[R]e[n]ame")
					vim.keymap.set({ "n", "v" }, "<leader>ca", function()
						vim_lsp_buf.code_action()
					end, { desc = "LSP Code Actions" })
					map("K", vim_lsp_buf.hover, "Hover Documentation")
					map("gS", vim_lsp_buf.signature_help, "Signature Documentation")
					vim.keymap.set({ "n", "v" }, "<leader>lf", function()
						vim_lsp_buf.format({ async = false })
					end, { desc = "LSP Format" })
				end,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local lspconfig = require("lspconfig")
						local server = opts.servers[server_name] or {}

						server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
						lspconfig[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
