-- Default global keys
vim.g.mapleader = " "
vim.keymap.set("n", ";", ":")

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- window control in normal mode
vim.keymap.set('n', '<M-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('n', '<M-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('n', '<M-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('n', '<M-l>', [[<Cmd>wincmd l<CR>]])

-- split controls
vim.keymap.set('n', '<leader>sh', '<Cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>sv', '<Cmd>split<CR>')

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')

-- Go to previous buffer
vim.keymap.set('n', '<leader>b', '<Cmd>b#<CR>')

-- Toggle fullscreen for current buffer
function toggle_fullscreen_buffer()
	-- autosave feature
    --[[ if vim.bo.modified then
        vim.cmd('update')
    end
]]
    local is_tab = vim.fn.tabpagenr('$') > 1

    if is_tab then
        vim.cmd('tabc')
    else
        vim.cmd('tab split')
    end
end

vim.api.nvim_set_keymap('n', '<leader>sf', ':lua toggle_fullscreen_buffer()<CR>', { noremap = true, silent = true })

