M = function()
    require('lspsaga').setup({
        ui = {
            code_action = "󱓈 ",
        },
        code_action = {
            keys = {
                quit = '<ESC>',
                exec = '<CR>',
            }
        },
        -- definition = {
        --     edit = '<CR>',
        --     vsplit = 'v',
        --     split = 's',
        --     tabe = 't',
        --     quit = '<ESC>',
        -- },
        rename = {
            quit = '<ESC>',
            exec = '<CR>',
        }
    })
end

return M
