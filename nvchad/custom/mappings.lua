---@type MappingsTable
local M = {}

M.disabled = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tt"] = {
  function()
     require("base46").toggle_transparency()
  end,
  "toggle transparency",
    },
  },
}

-- more keybinds!

return M
