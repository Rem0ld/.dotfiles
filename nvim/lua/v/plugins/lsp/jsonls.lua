local _ = {}

_.setup = function(on_attach, capabilities)
	require("lspconfig").jsonls.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
		init_options = {
			provideFormatter = true,
		},
	})
end

return _
