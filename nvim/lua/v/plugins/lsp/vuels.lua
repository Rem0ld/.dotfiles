local _ = {}

_.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.vuels.setup({
		cmd = { "vue-language-server", "--stdio" },
		-- root_dir = require("lspconfig").util.root_pattern("vue.config.js", "nuxt.config.ts", "vite.config.ts"),
		-- filetypes = { "vue" },
		-- init_options = {
		-- 	languageFeatures = {
		-- 		implementation = true, -- new in @volar/vue-language-server v0.33
		-- 		references = true,
		-- 		definition = true,
		-- 		typeDefinition = true,
		-- 		callHierarchy = true,
		-- 		hover = true,
		-- 		rename = true,
		-- 		renameFileRefactoring = true,
		-- 		signatureHelp = true,
		-- 		codeAction = true,
		-- 		workspaceSymbol = true,
		-- 		completion = {
		-- 			defaultTagNameCase = "both",
		-- 			defaultAttrNameCase = "kebabCase",
		-- 			getDocumentNameCasesRequest = false,
		-- 			getDocumentSelectionRequest = false,
		-- 		},
		-- },
		-- 	},
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return _
