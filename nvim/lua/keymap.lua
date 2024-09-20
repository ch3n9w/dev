local vim = vim
local Base = {
    movement = {
        { { 'n', 'v' }, 'j',     "v:count == 0 ? 'gj' : 'j'",                    { expr = true, silent = true, desc = 'go to next wrapline' } },
        { { 'n', 'v' }, 'k',     "v:count == 0 ? 'gk' : 'k'",                    { expr = true, silent = true, desc = 'go to previous wrapline' } },
        { { 'n', 'v' }, 'L',     'g_',                                           { desc = 'go to line end' } },
        { { 'n', 'v' }, 'H',     '^',                                            { desc = 'go to line begin' } },

        -- page scroll
        { { 'n', 'v' }, '<C-u>', math.floor(vim.fn.winheight(0) / 2) .. '<C-u>', { desc = 'scroll half page forward' } },
        { { 'n', 'v' }, '<C-d>', math.floor(vim.fn.winheight(0) / 2) .. '<C-d>', { desc = 'scroll half page backward' } },

        { 'n',          '<C-i>', '<C-i>',                                        { desc = 'fix conflict caused by <Tab> mapping' } },
    },
    buffer = {
        { 'n', '<Tab>',   '<CMD>bnext<CR>', { desc = 'next buffer' } },
        { 'n', '<S-Tab>', '<CMD>bprev<CR>', { desc = 'prev buffer' } },
    },
    edit = {
        { 'i', '<C-BS>',      '<C-W>',  { desc = 'delete word forward' } },
        { 'v', 'y',           '"*ygvy', { desc = 'copy' } },
        { 'n', 'yw',          'yiw',    { desc = 'copy the word where cursor locates' } },
        { 'n', '<C-S-v>',     '<C-v>',  { desc = 'start visual mode blockwise' } },
        { 'v', '>',           '>gv',    { desc = 'indent while keeping virtual mode after ' } },
        { 'v', '<',           '<gv',    { desc = 'indent while keeping virtual mode after ' } },
        { 'n', '<Backspace>', 'ciw',    { desc = 'delete word and edit in normal mode' } },
        { 'v', '<Backspace>', 'c',      { desc = 'delete and edit in visual mode' } },
    },
    cmd = {
        { { 'n', 'v' }, ';', ':',           { nowait = true, desc = 'enter commandline mode' } },
        { 'n',          'q', '<CMD>q!<CR>', { desc = 'quit neovim' } },
        { 'n',          'Q', 'q',           { desc = 'macro record' } },
    },
    lsp = {
        { 'n', 'gn', vim.lsp.buf.rename,        { desc = 'rename symbol' } },
        { 'n', 'g=', vim.lsp.buf.format,        { desc = 'format document' } },
        { 'n', 'gh', vim.lsp.buf.hover,         { desc = 'show documentation' } },
        { 'n', 'ge', vim.diagnostic.open_float, { desc = 'show diagnostic' } },
        { 'n', 'gd', vim.lsp.buf.definition,    { desc = 'go to definition' } },
    },
    fold = {
        { 'n', '<CR>',          'za', { desc = 'toggle fold' } },
        { 'n', '<2-LeftMouse>', 'za', { desc = 'toggle fold' } },
    },
    modeSwitch = {
        { 'i', '<ESC>', '<C-O><CMD>stopinsert<CR>', { desc = 'exit to normal mode while keeping cursor location' } },
    },
    comment = {
        { 'v', '<C-/>', 'gc',  { desc = 'comment', remap = true, silent = true } },
        { 'v', '<C-_>', 'gc',  { desc = 'comment', remap = true, silent = true } },
        { 'n', '<C-/>', 'gcc', { desc = 'comment', remap = true, silent = true } },
        { 'n', '<C-_>', 'gcc', { desc = 'comment', remap = true, silent = true } },
    },
}

local Plugin = {
    fzf = {
        { 'n', 'sw', function() require('fzf-lua').live_grep() end,        { desc = 'search word' } },
        { 'n', 'sf', function() require('fzf-lua').files() end,            { desc = 'search file' } },
        { 'n', 'z',  function() require('fzf-lua').buffers() end,          { desc = 'search buffer' } },
        { 'n', 'ga', function() require('fzf-lua').lsp_code_actions() end, { desc = 'code action' } },
        { 'n', 'gr', function() require('fzf-lua').lsp_references() end,   { desc = 'find reference' } },
    },
    flash = {
        { { "n" }, 'f', function() require("flash").jump() end, { desc = 'jump in screen' } },
    },
    -- keymaps are in configuration of nvim-cmp
    cmp = {},
    -- keymaps are in configuration of nvim-surround
    surround = {},
}

vim.g.register_keymap(Base)
vim.g.register_keymap(Plugin)
