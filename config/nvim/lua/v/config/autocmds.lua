local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function set_indent_size(size)
  vim.api.nvim_buf_set_option(0, "shiftwidth", size)
  vim.api.nvim_buf_set_option(0, "tabstop", size)
  vim.api.nvim_buf_set_option(0, "softtabstop", size)
end

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_option(
      0,
      "formatoptions",
      (
        string.gsub(
          vim.api.nvim_buf_get_option(0, "formatoptions"),
          "[cro]",
          ""
        )
      )
    )
  end,
})

autocmd("FileType", {
  pattern = { "lua", "rust", "go", "gitconfig" },
  callback = function()
    set_indent_size(2)
  end,
})

autocmd("FileType", {
  pattern = "make",
  callback = function()
    set_indent_size(4)
    vim.api.nvim_buf_set_option(0, "expandtab", false)
  end,
})

autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    vim.cmd([[FormatWrite]])
  end,
  group = augroup("FormatAutogroup", { clear = true }),
})

local function goimports(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate({ context = { context, "t", true } })

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result =
    vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then
    return
  end
  local actions = result[1].result
  if not actions then
    return
  end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

autocmd("BufWritePre", {
  pattern = { "go" },
  callback = goimports,
})
