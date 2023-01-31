local _ = {}

_.setup = function(on_attach, capabilities)
	require("typescript").setup({
		server = {
			on_attach = function(client, bufnr)
				client.server_capabilities.document_formatting = false

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		},
	})
end

return _
