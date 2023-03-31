local _ = {}

_.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.prismals.setup({
		-- TODO: look for directory prisma here !!
		root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return _
