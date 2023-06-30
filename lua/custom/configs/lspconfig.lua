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
    "jdtls",
    "gopls",
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

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go' },
  callback = function()
    local params = vim.lsp.util.make_range_params(nil, 'utf-16')
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, 'utf-16')
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

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
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      buildFlags = { "-tags=wireinject" },
    },
  },
}
