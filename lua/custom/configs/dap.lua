local dap = require "dap"

local M = {}
-- Python
-- dap.adapters.python = {
--     type = "executable",
--     command = function()
--         local pythonPath = os.getenv "VIRTUAL_ENV"
--         if pythonPath == nil then
--             pythonPath = ""
--         end
--         return pythonPath .. "/bin/python"
--     end,
--     args = { "-m", "debugpy.adapter" },
-- }
--
-- dap.configurations.python = {
--     {
--         type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python
--         request = "launch",
--         name = "Debug current file",
--
--         -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
--         program = "${file}", -- This configuration will launch the current file if used.
--         pythonPath = function()
--             local pythonPath = os.getenv "VIRTUAL_ENV"
--             if pythonPath == nil then
--                 pythonPath = ""
--             end
--             return pythonPath .. "/bin/python"
--         end,
--     },
-- }
--
local dapui = require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Rust
--
return M
