local vim = vim

M = {}


M.delete_win_or_buf = function()
    local pre_exit = ''
    local exit = 'quit'
    local current_bufnr = vim.api.nvim_win_get_buf(0)
    local current_buf_name = vim.api.nvim_buf_get_name(current_bufnr)
    -- local current_win_number = vim.api.nvim_get_current_win()
    local is_valid = function(bufnr)
        if not bufnr or bufnr < 1 then return false end
        local exists = vim.api.nvim_buf_is_valid(bufnr)
        return vim.bo[bufnr].buflisted and exists
    end
    -- the current buffer should be valid
    if is_valid(current_bufnr) then
        pre_exit = 'write'
        exit = 'Bdelete'
        local should_quit = 0
        -- check if there is other window contains valid buffer
        -- for _, win in ipairs(vim.api.nvim_list_wins()) do
        --     local bufnr = vim.api.nvim_win_get_buf(win)
        --     -- bufnr ~= current_bufnr
        --     if win ~= current_win_number and is_valid(bufnr) then
        --         pre_exit = 'write'
        --         exit = 'quit'
        --         should_quit = 1
        --         break
        --     end
        -- end
        if should_quit == 0 then
            -- if there is only [No Name], quitall
            local valid_buffer_number = #vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
            if current_buf_name == "" and valid_buffer_number == 1 then
                pre_exit = ''
                exit = 'quitall'
            end
        end
    end
    -- dont block exit even failed to save
    pcall(vim.cmd, pre_exit)
    vim.cmd(exit)
    vim.cmd.wincmd("=")
end

M.format = function()
    vim.lsp.buf.format()
    vim.cmd('write')
end

M.wq_all = function()
    vim.cmd('silent wa')
    vim.cmd('qa')
end

M.toggle_tree = function()
    local t = function()
        -- vim.cmd("Neotree show last toggle")
        vim.cmd("Neotree focus last toggle")
        vim.cmd.wincmd("=")
    end
    vim.fn.timer_start(1, t)
end

M.quit_win = function ()
    vim.api.nvim_win_close(0, true)
    vim.cmd.wincmd("=")
end

M.preview_note = function ()
    if vim.bo.filetype == 'markdown' then
        vim.cmd('MarkdownPreviewToggle')
    elseif vim.bo.filetype == 'tex' then
        vim.cmd('VimtexCompile')
    end
end

return M
