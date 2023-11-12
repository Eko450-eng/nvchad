---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
    theme = "ayu_dark",
    theme_toggle = { "decay", "ayu_dark" },
    transparency = false,
    nvdash = {
        load_on_startup = false,
    },
    telescope = {
        style = "bordered", -- borderless / bordered
      },
    hl_override = highlights.override,
    hl_add = highlights.add,
    tabufline = {
        enabled = true,
    },
}

M.plugins = "custom.plugins"
local hlgroups = {
    "TblineFill",
    "TbLineBufOn",
    "TbLineBufOff",
    "TbLineBufOnModified",
    "TbBufLineBufOffModified",
    "TbLineBufOnClose",
    "TbLineBufOffClose",
    "TblineTabNewBtn",
    "TbLineTabOn",
    "TbLineTabOff",
    "TbLineTabCloseBtn",
    "TBTabTitle",
    "TbLineThemeToggleBtn",
    "TbLineCloseAllBufsBtn",
    "Normal",
    "NvimTreeNormal",
}
-- for _, hlgroup in ipairs(hlgroups) do
--     M.ui.hl_override[hlgroup] = { bg = "none" }
-- end
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

local opt = vim.opt

opt.incsearch = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.relativenumber = true

return M
