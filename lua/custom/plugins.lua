local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  { "dart-lang/dart-vim-plugin", lazy=false },
  {
    "olexsmir/gopher.nvim", lazy=false,
      config = function()
          require("flutter-tools").setup {}
      end,
  },
  {"akinsho/flutter-tools.nvim", lazy=false},
  {"tpope/vim-dadbod", lazy=false},
  {"kristijanhusak/vim-dadbod-ui", lazy=false},
  {"darrikonn/vim-gofmt", lazy=false},
  {"mfussenegger/nvim-jdtls", lazy=false},
  {"vonHeikemen/lsp-zero.nvim", lazy=false,},
  {"dart-lang/dart-vim-plugin", lazy=false},
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {"jakerobers/vim-hexrgba", lazy=false},
  {
      "numToStr/Comment.nvim",
      dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
          require("Comment").setup {
              pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
          }
      end,
  },
  { "joeveiga/ng.nvim", lazy = false },
  {
      "toppair/peek.nvim",
      lazy = false,
      build = "deno task --quiet build:fast",
      config = function()
          vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
          vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
          require("peek").setup {
              auto_load = true,
              close_on_bdelete = true,
              syntax = true,
              theme = "dark",
              update_on_change = true,
              app = "webview",
              filetype = { "markdown" },
              throttle_at = 200000,
              throttle_time = "auto",
          }
      end,
  },
  {
      "simrat39/rust-tools.nvim",
      ft = "rust",
      dependencies = "neovim/nvim-lspconfig",
      config = function()
          require "custom.configs.rust-tools"
      end,
  },
  {
      "rust-lang/rust.vim",
      ft = "rust",
      init = function()
          vim.g.rustfmt_autosave = 1
      end,
  },
  {
      "rcarriga/nvim-dap-ui",
      opts = require "custom.configs.dap-ui",
  },
  {
      "mfussenegger/nvim-dap-python",
      config = function()
          require("dap-python").setup(os.getenv "VIRTUAL_ENV" .. "/bin/python")
      end,
  },
  {
      "mfussenegger/nvim-dap",
      config = function()
          require "custom.configs.dap"
      end,
  },
  {
      "https://github.com/doki-theme/doki-theme-vim.git",
  },
  {
      "theprimeagen/harpoon",
      lazy = false,
  },

  {
      "neovim/nvim-lspconfig",
      dependencies = {
          -- format & linting
          {
              "jose-elias-alvarez/null-ls.nvim",
              config = function()
                  require "custom.configs.null-ls"
              end,
          },
      },
      config = function()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
      end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
      "williamboman/mason.nvim",
      opts = overrides.mason,
  },

  {
      "nvim-treesitter/nvim-treesitter",
      opts = overrides.treesitter,
  },

  {
      "nvim-tree/nvim-tree.lua",
      opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
          require("better_escape").setup()
      end,
  },
}

return plugins
