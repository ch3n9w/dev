M = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            "bashls",
            "rome",
            "gopls",
            "lua_ls",
            "clangd",
            "dockerls",
            "rust_analyzer",
            "pyright",
            "intelephense",
            "marksman",
        },
    })
    require('mason-tool-installer').setup {
        ensure_installed = {
            'bash-language-server',
            'clangd',
            'gopls',
            'delve',
            'intelephense',
            'lua-language-server',
            'marksman',
            'pyright',
            'black',
            'isort',
            'rome',
            'rust-analyzer',
            'rustfmt',
            'yaml-language-server',
            'yamlfmt',
            'dockerfile-language-server'
        },

        auto_update = true,
        run_on_start = true,
        start_delay = 3000, -- 3 second delay
        debounce_hours = 5, -- at least 5 hours between attempts to install/update
    }
end

return M
