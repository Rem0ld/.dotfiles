local M = {}

---@type PluginLspKeys
M._keys = nil

---@return (LazyKeys|{has?:string})[]
function M.get()
    local format = require("lazyvim.plugins.lsp.format").format
    ---@class PluginLspKeys
    -- stylua: ignore
    M._keys = M._keys or {
        { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
        { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
        { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
        { "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
        { "K", vim.lsp.buf.hover, desc = "Hover" },
        { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
        { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
        { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
        { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
        { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
        { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
        { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
        { "<leader>lca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
        { "<leader>lcf", format, desc = "Format Document", has = "documentFormatting" },
        { "<leader>lcf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
        { "<leader>lcr", M.rename, expr = true, desc = "Rename", has = "rename" },
    }
  return M._keys
end

return M
