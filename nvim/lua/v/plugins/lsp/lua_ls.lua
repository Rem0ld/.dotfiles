local _ = {}

_.setup = function(on_attach, capabilities)
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		settings = {
			prefer_null_ls = true,
			Lua = {
				completion = {
					workspaceWord = true,
					callSnippet = "Both",
				},
				format = {
					enable = true,
				},
				diagnostics = {
					groupSeverity = {
						strong = "Warning",
						strict = "Warning",
					},
					groupFileStatus = {
						["ambiguity"] = "Opened",
						["await"] = "Opened",
						["codestyle"] = "None",
						["duplicate"] = "Opened",
						["global"] = "Opened",
						["luadoc"] = "Opened",
						["redefined"] = "Opened",
						["strict"] = "Opened",
						["strong"] = "Opened",
						["type-check"] = "Opened",
						["unbalanced"] = "Opened",
						["unused"] = "Opened",
					},
					unusedLocalExclude = { "_*" },
				},
				misc = {
					parameters = {
						"--log-level=trace",
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
		capabilities = capabilities,
	})
end

return _
