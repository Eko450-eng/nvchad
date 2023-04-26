local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local formatters = null_ls.builtins.formatting

local sources = {
    formatters.prettier,
    formatters.stylua,
    formatters.black,
}

null_ls.setup {
    debug = true,
    sources = sources
}
-- local linters = require "null-ls.linters"
-- linters.setup {
--   { name = "flake8" },
--   {
--     name = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }
--
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     name = "proselint",
--   },
-- }
