---@diagnostic disable: different-requires
--
---@type MappingsTable
local M = {}

M.disabled = {
    n = {
        ["<leader>x"] = "",
        ["<leader>B"] = "",
        ["<leader>v"] = "",
        ["<leader>h"] = "",
        ["<leader>n"] = "",
        ["<leader>rn"] = "",
    },
}

M.dap = {
    n = {
        ["<C-y>"] = {
            function()
                require("dapui").toggle()
            end,
            "toggle ui",
        },
        ["<leader>b"] = {
            function()
                require("dap").toggle_breakpoint()
            end,
            "toggle breakpoint",
        },
        ["<C-A>"] = {
            function()
                require("custom.language_mappings").debug_test[vim.bo.filetype]()
            end,
           "debug test",
        },
    },

    v = {
        ["<C-k>"] = {
            function()
                require("dapui").eval()
            end,
            "evaluate selection",
        },
    },
}

M.telescope = {
    n = {
        ["<C-p>"] = { "<cmd> Telescope git_files <CR>", "find git files" },
        ["<leader>P"] = { "<cmd> Telescope project <CR>", "Projects view" },
        ["<leader>B"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    },
}

M.nvimtree = {
    n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Open NvimTree" }
    }
}

M.general = {
    n = {
        ["<leader>q"] = {
            function()
                require("nvchad_ui.tabufline").close_buffer()
            end,
            "close buffer",
        },
        ["n"] = { "nzzzv", "find next occurrence" },
        ["N"] = { "Nzzzv", "find previous occurrence" },
        ["<leader>k"] = { ":lnext<CR>zz", "location next" },
        ["<leader>j"] = { ":lprev<CR>zz", "location previous" },
        ["<M-j>"] = { ":cn<CR>zz", "quickfix next" },
        ["<M-k>"] = { ":cp<CR>zz", "quickfix previous" },
        ["<leader>d"] = { '"_d', "delete into void" },
        ["<leader>fs"] = {"<cmd> :w <CR>", "Save file"},
        ["<leader>p"] = {"<cmd> :Lazy <CR>", "Open Lazy"},
        ["<leader>l"] = {"<cmd> :MasonInstall <CR>", "Open Mason"},
    },

    v = {
        ["K"] = { ":m'<-2<CR>gv=gv", "move selection up" },
        ["J"] = { ":m'>+1<CR>gv=gv", "move selection down" },
        ["("] = { "c()<C-c>P", "surround with '()'" },
        ["{"] = { "c{}<C-c>P", "surround with '{}'" },
        ["["] = { "c[]<C-c>P", "surround with '[]'" },
        ["'"] = { "c''<C-c>P", "surround with single quotes" },
        ['"'] = { 'c""<C-c>P", "surround with double quotes' },
        ["`"] = { 'c``<C-c>P", "surround with tacks' },
        ["<leader>d"] = { '"_d', "delete into void" },
        ["<leader>p"] = { '"_p', "paste and delete previous into void" },
    },
}

M.harpoon = {
    n = {
        ["<C-e>"] = {
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            "toggle quick menu",
        },
        ["<leader>a"] = {
            function()
                require("harpoon.mark").add_file()
            end,
            "add file",
        },
        ["<C-f>"] = {
            function()
                require("harpoon.ui").nav_file(1)
            end,
            "nav file 1",
        },
        ["<C-g>"] = {
            function()
                require("harpoon.ui").nav_file(2)
            end,
            "nav file 2",
        },
    },
}

-- more keybinds!

return M
