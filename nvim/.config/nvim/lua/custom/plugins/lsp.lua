local ensure_installed_all = {
	"lua-language-server",
	"clangd",
	"pyright",
	"bash-language-server",
	"gopls",
	"rust-analyzer",
	"vtsls",
	"omnisharp",
	"jdtls",
	"json-lsp",
	"yaml-language-server",
	"stylua",
	"debugpy",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	local mr = require("mason-registry")
	local function ensure_installed()
		for _, tool in ipairs(ensure_installed_all) do
			local ok, p = pcall(require("mason-registry").get_package, tool)
			if ok then
				if not p:is_installed() then
					print("Installing: " .. tool)
					p:install()
				end
			else
				print("Package not found: " .. tool)
			end
		end
	end
	if mr.refresh then
		mr.refresh(ensure_installed)
	else
		ensure_installed()
	end
end, {
	desc = "Install Mason LSP and Tools",
})

local function setup_lsp_keymaps(client, bufnr)
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

	keymap("n", "gd", vim.lsp.buf.definition, "LSP: [G]oto [D]efinition")
	keymap("n", "grr", vim.lsp.buf.references, "LSP: [G]oto [R]eferences")
	keymap("n", "gri", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation")
	keymap("n", "gry", vim.lsp.buf.type_definition, "LSP: Type [D]efinition")
	keymap("n", "grd", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")
	keymap("n", "grn", vim.lsp.buf.rename, "LSP: Rename")
	keymap("n", "K", vim.lsp.buf.hover, "LSP: Hover")
	keymap("n", "grs", vim.lsp.buf.signature_help, "LSP: Signature Help")
	keymap({ "n", "x" }, "gra", vim.lsp.buf.code_action, "LSP: Code Actions")
	keymap({ "n", "v" }, "grf", function()
		vim.lsp.buf.format({ async = false })
	end, "LSP: Format")
	keymap("n", "grd", function()
		vim.diagnostic.open_float(nil, { scope = "line" })
	end, "Show line diagnostics")
end

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Set up general LSP keymaps",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		vim.diagnostic.config({
			virtual_text = true,
		})

		client.server_capabilities.semanticTokensProvider = nil
		setup_lsp_keymaps(client, args.buf)
	end,
})

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
