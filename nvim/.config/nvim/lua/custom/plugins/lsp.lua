local ensure_installed_all = {
	"lua-language-server",
	"clangd",
	"pyright",
	"bash-language-server",
	"gopls",
	"rust-analyzer",
	"vtsls",
	"omnisharp",
	"json-lsp",
	"yaml-language-server",
	"stylua",
	"debugpy",
}

local function on_attach(client, bufnr)
	local function keymap(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- Diagnostics
	keymap("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous diagnostic")

	keymap("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next diagnostic")

	keymap("n", "[e", function()
		vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
	end, "Previous error")

	keymap("n", "]e", function()
		vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
	end, "Next error")

	-- LSP Navigation
	keymap("n", "gd", vim.lsp.buf.definition, "LSP: [G]oto [D]efinition")
	keymap("n", "grr", vim.lsp.buf.references, "LSP: [G]oto [R]eferences")
	keymap("n", "gri", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation")
	keymap("n", "gry", vim.lsp.buf.type_definition, "LSP: Type [D]efinition")
	keymap("n", "grd", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")

	-- Misc
	keymap("n", "grn", vim.lsp.buf.rename, "LSP: [R]e[n]ame")
	keymap("n", "K", vim.lsp.buf.hover, "LSP: Hover Documentation")
	keymap("n", "grs", vim.lsp.buf.signature_help, "LSP: Signature Documentation")
	keymap({ "n", "x" }, "gra", function()
		vim.lsp.buf.code_action()
	end, "LSP: Code Actions")
	keymap({ "n", "v" }, "<leader>lf", function()
		vim.lsp.buf.format({ async = false })
	end, "LSP: Format")
	keymap("n", "<leader>ld", function()
		vim.diagnostic.open_float(nil, { scope = "line" })
	end, "Show line diagnostics")

	local omnisharp_extended_ok, omnisharp_extended = pcall(require, "omnisharp_extended")
	if omnisharp_extended_ok and client.name == "omnisharp" then
		keymap("n", "gd", omnisharp_extended.lsp_definition, "OmniSharp: Go to Definition")
		keymap("n", "gry", omnisharp_extended.lsp_type_definition, "OmniSharp: Type Definition")
		keymap("n", "grr", omnisharp_extended.lsp_references, "OmniSharp: References")
		keymap("n", "gri", omnisharp_extended.lsp_implementation, "OmniSharp: Implementation")
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Configure LSP keymaps",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		vim.diagnostic.config({
			virtual_text = true,
		})
		client.server_capabilities.semanticTokensProvider = nil
		on_attach(client, args.buf)
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
		local server_configs = vim.iter(vim.fn.glob(lsp_dir .. "/*.lua", false, true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()

		vim.lsp.enable(server_configs)
	end,
})

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "Hoffs/omnisharp-extended-lsp.nvim" },
		{ "b0o/SchemaStore.nvim", lazy = true },
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			opts = {
				ensure_installed = ensure_installed_all,
			},
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
	},
}
