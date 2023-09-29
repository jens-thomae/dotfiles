---@type MappingsTable
local M = {}

M.disabled = {}

local function toggle_tabwidth()
    if (vim.o.tabstop == 4) then
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    else
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
    end
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tt"] = {"<cmd>highlight Normal guibg=none<CR>", "enable transparent background"},

    ["<leader>tw"] = { toggle_tabwidth, "test" },
  },
}

-- more keybinds!

return M
