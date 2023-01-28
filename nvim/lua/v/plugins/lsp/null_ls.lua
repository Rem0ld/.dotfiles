local _null_ls, null_ls = pcall(require, "null-ls")

if not _null_ls then
  return
end

local include_root_file = function(...)
  local files = { ... }
  return function(utils)
    return utils.root_has_file(files)
  end
end

local exclude_root_file = function(...)
  local files = { ... }
  return function(utils)
    return not utils.root_has_file(files)
  end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local _ = {}

_.setup = function(on_attach)
  null_ls.setup({
    save_after_format = true,
    sources = {
      diagnostics.hadolint,
      diagnostics.markdownlint,
      diagnostics.shellcheck,
      diagnostics.eslint_d.with({
        condition = include_root_file({
          ".eslintrc.json",
        }),
      }),

      formatting.prettierd.with({
        condition = include_root_file({ ".prettierrc", ".prettierrc.json" }),
      }),
      formatting.eslint_d.with({
        condition = include_root_file({ ".eslintrc.json" }),
      }),
      formatting.stylua,
      formatting.shfmt.with({
        filetypes = { "sh", "bash", "zsh" },
      }),

      code_actions.shellcheck,
      code_actions.eslint_d,
    },
    on_attach = on_attach,
  })
end

return _
