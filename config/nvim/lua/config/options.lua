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
vim.lsp.config("vtsls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json", "tsconfig.json" }, { upward = true })[1]),
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
        importModuleSpecifierEnding = "ts",
        autoImportSpecifierExcludeRegexes = { "^libs/", "^apps/", ".*/dist" },
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
        importModuleSpecifierEnding = "js",
        autoImportSpecifierExcludeRegexes = { "^libs/", "^apps/" },
      },
    },
  },
})

vim.lsp.config("oxlint", {
  cmd = { "oxlint", "lsp" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = vim.fs.dirname(vim.fs.find({ "oxlintrc.json", "package.json", ".git" }, { upward = true })[1]),
  settings = {
    oxlint = {
      -- Optional: any oxlint-specific settings you want
      enable = true,
      -- config = "oxlintrc.json", -- if you have a config file
    },
  },
})

vim.lsp.config("eslint", {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json", "tsconfig.json" }, { upward = true })[1]),
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".luarc.json", ".luacheckrc" }, { upward = true })[1]),
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

vim.lsp.enable({ "lua_ls", "eslint", "vtsls", "vue_ls", "oxlint" })
