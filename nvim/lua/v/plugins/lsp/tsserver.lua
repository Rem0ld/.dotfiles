local _ = {}

_.setup = function(on_attach, capabilities)
	require("lspconfig").tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		init_options = {
			hostInfo = "neovim",
			maxTsServerMemory = 4096,
		},
	})
end

return _
