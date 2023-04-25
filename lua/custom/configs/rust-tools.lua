local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
local opts = {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}

require("rust-tools").setup(opts)

