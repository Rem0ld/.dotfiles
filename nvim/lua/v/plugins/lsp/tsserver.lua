local _ = {}

_.setup = function(on_attach, capabilities)
	require("typescript").setup({
		server = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	})
end

return _
