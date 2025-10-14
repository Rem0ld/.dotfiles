-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true
vim.g.auto_format = true
-- Configure LSP clients

-- Set default root markers for all clients
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- Set configuration for typescript language server
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

vim.lsp.config("vue_ls", {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json", "tsconfig.json" }, { upward = true })[1]),
  settings = {
    typescript = {
      tsdk = vim.fn.stdpath("data") .. "/mason/bin/",
      -- adjust path if you’re not using mason
    },
    vue = {
      hybridMode = false, -- set to true if you want Take Over Mode (TS + Vue in one server)
    },
  },
})

-- Enable Typescript Language Server
vim.lsp.enable("ts_ls")

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".luarc.json", ".luacheckrc" }, { upward = true })[1]),
})

vim.lsp.enable("lua_ls")
