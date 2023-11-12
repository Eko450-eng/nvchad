local options = {
  ensure_installed = { "help", "python", "javascript", "typescript", "java", "c", "lua", "rust" },

  sync_install = false,
  auto_install = true,
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
