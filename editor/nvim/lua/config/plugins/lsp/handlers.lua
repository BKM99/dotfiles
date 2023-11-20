local M = {}

local function lsp_keymaps(bufnr)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>zz")
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	-- vim.keymap.set("n", "<space>lf", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end)
end

local function capabilities()
	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not ok then
		return {}
	end

	return cmp_nvim_lsp.default_capabilities()
end

M.setup = function()
	local config = {
		-- disable virtual text
		virtual_lines = true,
		virtual_text = true,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many", -- Or "always"
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

M.custom_on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	-- client.server_capabilities.semanticTokensProvider = nil
end

M.custom_capabilities = capabilities()

return M
