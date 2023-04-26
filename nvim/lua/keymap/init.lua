local vim = vim
local Movement = {
    -- { 'n', 'w', ':w<CR>w' },
    { 'n', '<leader>h', '<C-w>h' },
    { 'n', '<leader>j', '<C-w>j' },
    { 'n', '<leader>k', '<C-w>k' },
    { 'n', '<leader>l', '<C-w>l' },
    { 'n', 'j',         "v:count == 0 ? 'gj' : 'j'",                   { expr = true, silent = true } },
    { 'n', 'k',         "v:count == 0 ? 'gk' : 'k'",                   { expr = true, silent = true } },
    { 'n', 'J',         ':bprevious!<CR>' },
    { 'n', 'K',         ':bnext!<CR>' },
    { 'n', 'H',         ':bprevious!<CR>' },
    { 'n', 'L',         ':bnext!<CR>' },
    -- only scroll 1/3 size of page
    { 'n', '<C-b>',     math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
    { 'n', '<C-j>',     math.floor(vim.fn.winheight(0) / 3) .. '<C-d>' },
    { 'n', '<C-k>',     math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
    { 'v', '<C-j>',     math.floor(vim.fn.winheight(0) / 3) .. '<C-d>' },
    { 'v', '<C-k>',     math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
    { 'n', '<PageUp>',  '<C-u>' },
    -- { 'n', '<C-Left>',     '<CMD>po<CR>' },
    -- { 'n', '<C-Right>',     '<CMD>ta<CR>' },

    -- jump to home or end
    { 'i', '<C-h>',     '<ESC>I' },
    { 'i', '<C-l>',     '<ESC>A' },
    { 'n', '<C-h>',     '<ESC>^' },
    { 'n', '<C-l>',     '<ESC>$' },
    { 'n', '(',         '<ESC>^' },
    { 'n', ')',         '<ESC>$' },
    { 'v', '<C-l>',     '$' },
    { 'v', '<C-h>',     '^' },

    { 'i', '<C-Down>',  '<C-O><C-E>' },
    { 'i', '<C-Up>',    '<C-O><C-Y>' },
    { 'n', 'gd',        vim.lsp.buf.definition },

}

local Edit = {
    -- dont move cursor when back to normal mode
    { 'i', '<ESC>',  '<C-O>:stopinsert<CR>' },
    -- delete word forward
    { 'i', '<C-BS>', '<C-W>' },
    -- remember to configure alacritty with:
    -- { key: Back, mods: Control, chars: "\x17"}
    -- and configure Ctrl+/-Backspace's output as \x17
    { 'i', '\x17',   '<C-W>' },

    { 'i', '<C-j>',  '<ESC>o' },
    { 'i', '<C-k>',  '<ESC>O' },
    -- { 'n', '<LeftRelease>', '<LeftRelease><cmd>startinsert<CR>'},
    { 'i', '<C-z>',  '<cmd>undo<CR>' },
    -- { 'n', '<C-v>',  '<C-R>+' },
    { 'i', '<C-v>',  '<C-R>+' },
    { 'v', 'y',      '"*ygvy' },
}

local Cmd = {
    { 'n', ';',     ':',                                    { nowait = true } },
    { 'v', ';',     ':',                                    { nowait = true } },
    { 'n', '<C-s>', '<CMD>w<CR>' },
    { 'i', '<C-s>', '<CMD>w<CR>' },
    { 'v', '<C-s>', '<CMD>w<CR>' },
    { 'n', 'Q',     'q' },
    -- format code using lsp
    -- { 'n', 'g=', ':lua vim.lsp.buf.format()<CR>' },
    { 'n', 'g=',    require("keymap.custom").FormatCode },
    -- keep virtual mode after indent
    { 'v', '>',     '>gv' },
    { 'v', '<',     '<gv' },
    -- show variable reference
    { 'n', 'gr',    vim.lsp.buf.references },
    -- enter to toggle fold
    { 'n', '<CR>',  'za' },
    -- save file with root permissions
    { 'c', 'w!',    require("keymap.custom").sudo_write },
}

-- keymaps that need plugin context are not include, like nvim-cmp
local Plugins = {
    bufdelete = {
        -- { 'n', 'q', ':write<CR>:Bdelete<CR>' },
        -- { 'v', 'q', ':write<CR>:Bdelete<CR>' },
        { 'n', 'q', require("keymap.custom").DeleteWinOrBuf },
        -- will affect lspsaga
        -- { 'v', 'q', require("keymap.custom").DeleteWinOrBuf },
    },
    telescope = {
        { 'n', 'sw', ':Telescope grep_string<CR>' },
        { 'n', 'sf', ':Telescope find_files<CR>' },
    },
    nvim_tree = {
        { 'n', '<leader>t', ':NvimTreeToggle<CR>' },
        { 'n', '<leader>c', ':cd %:h<CR>' },
    },
    aerial = {
        { 'n', '<leader>s', ':AerialToggle<CR>' },
    },
    comment = {
        { 'v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)' },
        { 'v', '<C-/>', '<Plug>(comment_toggle_linewise_visual)' },
        { 'n', '<C-_>', '<Plug>(comment_toggle_linewise_current)' },
        { 'n', '<C-/>', '<Plug>(comment_toggle_linewise_current)' },
    },
    hop = {
        { 'n', 'm', ':HopWord<CR>' },
    },
    lspsaga = {
        { 'n', 'ga', ':Lspsaga code_action<CR>',          { silent = true } },
        { 'n', 'ge', ':Lspsaga show_line_diagnostics<CR>' },
        { 'n', 'gh', ':Lspsaga hover_doc<CR>' },
        { 'n', 'gs', ':Lspsaga signature_help<CR>' },
        -- gr was assigned to referencetoogle
        { 'n', 'gn', ':Lspsaga rename<CR>' },
        -- just use left/right mouse click to goto definition
        -- or original gd for <C-o>
        -- { 'n', 'gd', ':Lspsaga peek_definition<CR>' },
    },
    -- bottom terminal
    toggleterm = {
        { 'n', 'ss',    ':ToggleTerm size=8 direction=horizontal<CR>' },
        { 't', 'ss',    '<C-\\><C-n>:ToggleTerm size=8 direction=horizontal<CR>' },
        { 't', '<esc>', '<C-\\><C-n>:wincmd p<CR>' },

    },
    -- dap debug
    dap = {
        { 'n', '<F1>',      ':lua require"dap".toggle_breakpoint()<CR>' },
        { 'n', '<F2>',      ':lua require"dap".continue()<CR>' },
        { 'n', '<F3>',      ':lua require"dap".step_into()<CR>' },
        { 'n', '<F4>',      ':lua require"dap".step_over()<CR>' },
        { 'n', '<leader>d', ':lua require"dapui".toggle()<CR>' },
    },
    github_upload = {
        -- image upload
        { 'n', '<C-p>', ":lua require('nvim-github-uploader').upload_img()<CR>" }
    }
    -- marks_nvim = {
    --     { 'n', 'MM', ':lua require"marks".toggle()<CR>' },
    --     { 'n', 'MJ', ':lua require"marks".next()<CR>' },
    --     { 'n', 'MK', ':lua require"marks".prev()<CR>' },
    -- },
}
local Other = {
    -- use mouse to manupulate folders
    -- { 'n', '<2-LeftMouse>', 'za' },
}

-- key map function
local key_mapper = function(mode, key, result, config)
    if nil == config then
        config = { noremap = true, silent = true }
    end
    -- vim.api.nvim_set_keymap(
    vim.keymap.set(
        mode,
        key,
        result,
        config
    )
    -- vim.keymap.set('n', '<C-o>', '<cmd>po<CR>')
end

for _, keymap_class in ipairs({ Movement, Edit, Cmd, Other }) do
    for _, keymap in ipairs(keymap_class) do
        if keymap[4] ~= nil then
            key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
        else
            key_mapper(keymap[1], keymap[2], keymap[3])
        end
    end
end


for _, plugin_keymap in pairs(Plugins) do
    for _, keymap in ipairs(plugin_keymap) do
        if keymap[4] ~= nil then
            key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
        else
            key_mapper(keymap[1], keymap[2], keymap[3])
        end
    end
end

--[[ key_mapper('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
key_mapper('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true}) ]]
-- nvim-tree settings
--
-- a: add file
-- r: rename file folder
-- x: delete file or folder and add to clipboard
-- d: just delete
-- c: copy file or folder
-- p: paste file or folder
-- v: will open the file in a vertical split, <C-q> can quit


vim.api.nvim_create_user_command(
    "Typora",
    require('keymap.custom').Typora,
    { desc = "start typora" }
)

vim.api.nvim_create_user_command(
    "ViewImage",
    require('keymap.custom').view_net_image,
    { desc = "view network image" }
)
