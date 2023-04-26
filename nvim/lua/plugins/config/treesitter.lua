M = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = false,
            -- keymaps = {
            --     init_selection = '<CR>',
            --     node_incremental = '<CR>',
            --     node_decremental = '<BS>',
            --     scope_incremental = '<TAB>',
            -- }
        },
    }
    -- And the highlight groups (Using dracula colors) are defined in after/syntax/markdown.vim:
end

return M
