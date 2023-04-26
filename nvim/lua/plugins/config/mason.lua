M = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
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
end

return M
