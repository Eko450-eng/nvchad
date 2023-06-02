local M = {}

M.coc = {
  build = "yarn install --frozen-lockfile"
}

M.blankline = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
    },
    indent = {
        enable = true,
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "rust-analyzer",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "angular-language-server",
    },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

return M
