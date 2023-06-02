local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities ---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"



-- if you just want default config for the servers then put them in a table
local servers = {
    "svelte",
    "cssls",
    "tsserver",
    "html",
    "clangd",
    "pyright",
    "prismals",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Angular
local uv = vim.loop
local function get_node_modules(root_dir)
    local root_node = root_dir .. "/node_modules"
    local stats = uv.fs_stat(root_node)
    if stats == nil then
        return ''
    else
        return root_node
    end
end

local default_node_modules = get_node_modules(vim.fn.getcwd())

local ngls_cmd = {
    "node",
    "/home/eko/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/",
    "--stdio",
    "--tsProbeLocations",
    default_node_modules,
    "--ngProbeLocations",
    default_node_modules,
    "--includeCompletionsWithSnippetText",
    "--includeAutomaticOptionalChainCompletions",
    "--logToConsole",
    "--logFile",
    "/home/eko/angularls.log",
}

lspconfig.angularls.setup {
}

-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "rust", "rs" },
--     root_dir = util.root_pattern "Cargo.toml",
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "by_self",
--             },
--             cargo = {
--                 allFeatures = true,
--             },
--             procMacro = {
--                 enable = true,
--             },
--         },
--     },
-- }

-- lspconfig.pyright.setup { blabla}
