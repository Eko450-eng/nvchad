local M = {
    -- layouts = {
    --     {
    --         elements = {
    --             -- "console",
    --             "breakpoints",
    --             "watches",
    --             "stacks",
    --             "scopes",
    --         },
    --         size = 60, -- 40 columns
    --         position = "right",
    --     },
    --     {
    --         elements = {
    --             { id = "repl", size = 1.0 },
    --         },
    --         size = 0.25, -- 25% of total lines
    --         position = "bottom",
    --     },
    -- },
    -- controls = {
    --     element = "scopes",
    -- },
}

-- Style configurations for Dap
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993930", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

return M
