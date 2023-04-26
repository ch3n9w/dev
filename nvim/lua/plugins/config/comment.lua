M = function()
    require('Comment').setup({
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = false,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
        },
    }
    )
end

return M
