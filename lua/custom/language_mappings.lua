local M = {}
M.debug_test = {
    rust = function()
        vim.cmd "RustDebuggables"
    end,
    python = function()
        require("dap-python").test_method()
    end
}

return M
