M = function()
    local cmp = require('cmp')
    local compare = require('cmp.config.compare')
    local lspkind = require('lspkind')
    local luasnip = require 'luasnip'
    local border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
    }
    local source_mapping = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TN]",
        path = "[Path]",
    }
    local tabnine = require('cmp_tabnine.config')

    tabnine:setup({
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = '..',
        ignored_file_types = {
            -- default is not to ignore
            -- uncomment to ignore in lua:
            -- lua = true
        },
        show_prediction_strength = false
    })
    -- -- https://github.com/L3MON4D3/LuaSnip/issues/780
    luasnip.setup({
        update_events = { "TextChanged", "TextChangedI" },
        region_check_events = { "CursorMoved", "CursorHold", "InsertEnter", "CursorMovedI" },
    })
    cmp.setup({
        completion = {
            -- highlight the first candidate
            completeopt = 'menu,menuone,noinsert',
        },
        window = {
            completion = {
                border = border,
                scrollbar = '║',
            },
            documentation = {
                border = 'rounded'
            }
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        formatting = {
            format = function(entry, vim_item)
                -- if you have lspkind installed, you can use it like
                -- in the following line:
                vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
                -- vim_item.menu = source_mapping[entry.source.name]
                if entry.source.name == "cmp_tabnine" then
                    local detail = (entry.completion_item.data or {}).detail
                    vim_item.kind = ""
                    if detail and detail:find('.*%%.*') then
                        vim_item.kind = vim_item.kind .. ' ' .. detail
                    end

                    if (entry.completion_item.data or {}).multiline then
                        vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                    end
                end
                local maxwidth = 80
                vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                return vim_item
            end,
        },
        -- formatting = {
        --     format = lspkind.cmp_format({
        --         mode = 'symbol',
        --         maxwidth = 50,
        --     }),
        -- },
        mapping = {
            ['<C-q>'] = cmp.mapping.close(),
            -- ['<C-y>'] = cmp.config.disable,
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_next_item()
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_prev_item()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<Down>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<Up>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'cmp_tabnine' },
            { name = 'luasnip' },
            { name = 'neorg' },
        }, {
            { name = 'buffer' },
        }),
        -- completion items sorting
        sorting = {
            priority_weight = 1.0,
            comparators = {
                compare.offset,
                compare.exact,
                require('cmp_tabnine.compare'),
                -- compare.scopes,
                compare.score,
                compare.recently_used,
                compare.locality,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        }
    })


    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.intelephense.setup {
        capabilities = capabilities,
        init_options = {
            -- for intelephense
            licenceKey = '/home/ch4ser/.config/nvim/intelephense_license_key',
            globalStoragePath = '/home/ch4ser/.config',
        },
        single_file_mode = true
    }
    lspconfig.pyright.setup {
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'workspace',
                },
            },
        },
    }
    lspconfig.gopls.setup {
        capabilities = capabilities,
        single_file_mode = true,
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        },
        init_options = {
            usePlaceholders = true,
        }
    }
    local other_servers = { "rome", "lua_ls", "rust_analyzer", "marksman", "dockerls", "bashls" }
    for _, server in ipairs(other_servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
            single_file_mode = true,
        }
    end
    -- for clangd
    capabilities.offsetEncoding = { "utf-16" }
    lspconfig.clangd.setup {
        capabilities = capabilities
    }
end

return M
