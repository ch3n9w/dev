return {
    {
        'ibhagwan/fzf-lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("fzf-lua").setup({
                winopts = {
                    preview = {
                        layout = 'vertical'
                    }
                }
            })
        end,
    },
}
