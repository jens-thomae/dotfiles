---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
    transparency = false,
  theme = "tokyonight",
  theme_toggle = { "tokyodark", "one_light" },

  hl_override = {
    Normal = {
      bg = {"black", 0}
    },
    highlights.override,
    require "custom.highlights"
  },

  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
