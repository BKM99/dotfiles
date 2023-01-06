local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local lsp_kind_status_ok, lspkind = pcall(require, "lspkind")
if not lsp_kind_status_ok then
    return
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
    region_check_events = "InsertEnter",
    delete_check_events = "InsertLeave",
})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
    group = unlinkgrp,
    pattern = { "s:n", "i:*" },
    desc = "Forget the current snippet when leaving the insert mode",
    callback = function(evt)
        if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
            luasnip.unlink_current()
        end
    end,
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
    {
        { name = "buffer", keyword_length = 5 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
            max_height = 15,
            max_width = 60,
        }),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",

            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]

                return vim_item
            end,
        }),
    },
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
