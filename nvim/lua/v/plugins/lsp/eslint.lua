local _ = {}

_.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.eslint.setup({
		root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
		on_attach = on_attach,
		capabilities = capabilities,
		enable = true,
		format = {
			enable = true,
		},
		packageManager = "npm",
		autoFixOnSave = true,
		codeActionsOnSave = {
			mode = "all",
			rules = { "!debugger", "!no-only-tests/*" },
		},
		linkTask = {
			enable = true,
		},
		-- settings = {
		-- 	format = {
		-- 		enable = true,
		-- 	},
		-- },
		-- handlers = {
		-- 	["window/showMessageRequest"] = function(_, result)
		-- 		if result.message:find("ENOENT") then
		-- 			return vim.NIL
		-- 		end
		--
		-- 		return vim.lsp.handlers["window/showMessageRequest"](nil, result)
		-- 	end,
		-- },
	})
end

return _
