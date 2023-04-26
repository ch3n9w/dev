M = function ()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.concealer"] = {},
            ["core.norg.manoeuvre"] = {},
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.export"] = {},
            ["core.integrations.treesitter"] = {},
            ["core.autocommands"] = {},
        }
    }
end

return M
