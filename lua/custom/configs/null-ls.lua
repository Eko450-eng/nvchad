local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local b = null_ls.builtins

local sources = {

    -- frontend dev
    b.formatting.deno_fmt,
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "yaml", "svelte", "tsx", "jsx" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua,
    -- general
    b.code_actions.refactoring,

    --docker
    b.diagnostics.hadolint,

    -- cpp
    b.formatting.clang_format,
    --python
    b.formatting.black,
    -- b.diagnostics.mypy,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
