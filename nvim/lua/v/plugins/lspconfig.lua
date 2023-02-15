return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
		"mason.nvim",
		"jose-elias-alvarez/typescript.nvim",
		"folke/neodev.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"b0o/schemastore.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		},
		autoformat = true,
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
	},
	config = function()
		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end

		-- if you want to set up formatting on save, you can use this as a callback
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- add to your shared on_attach callback
		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { table.unpack(bufopts), desc = "Go to Declaration" })
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>Telescope lsp_definitions<cr>",
				{ table.unpack(bufopts), desc = "Go to definition" }
			)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { table.unpack(bufopts), desc = "Hover" })
			vim.keymap.set(
				"n",
				"gi",
				"<cmd>Telescope lsp_implementations<cr>",
				{ table.unpack(bufopts), desc = "Go to implementation" }
			)
			vim.keymap.set(
				"n",
				"gK",
				vim.lsp.buf.signature_help,
				{ table.unpack(bufopts), desc = "Go to signature help" }
			)
			vim.keymap.set(
				"n",
				"<leader>lD",
				vim.lsp.buf.type_definition,
				{ table.unpack(bufopts), desc = "Go to type definition" }
			)
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { table.unpack(bufopts), desc = "Rename" })
			vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { table.unpack(bufopts), desc = "Code action" })
			vim.keymap.set(
				"n",
				"gr",
				"<cmd>Telescope lsp_references<cr>",
				{ table.unpack(bufopts), desc = "Go to references" }
			)
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, { table.unpack(bufopts), desc = "Format" })

			vim.keymap.set("n", "gl", vim.diagnostic.open_float, { table.unpack(bufopts), desc = "Line diagnostics" })
			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { table.unpack(bufopts), desc = "Lsp Info" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { table.unpack(bufopts), desc = "Next Diagnostic" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { table.unpack(bufopts), desc = "Previous Diagnostic" })

			if client.name == "tsserver" then
				local ns = vim.lsp.diagnostic.get_namespace(client.id)
				vim.diagnostic.disable(nil, ns)

				vim.keymap.set(
					"n",
					"<leader>lR",
					"<cmd>TSLspRenameFile<cr>",
					{ table.unpack(bufopts), desc = "Rename file" }
				)
				vim.keymap.set(
					"n",
					"<leader>lA",
					"<cmd>TSLspImportAll<cr>",
					{ table.unpack(bufopts), desc = "Import all" }
				)
			end

			if client.name ~= "null-ls" then
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_range_formatting = false
			end

			if client.server_capabilities.documentRangeFormattingProvider then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local servers = {
			"bashls",
			"cssls",
			"emmet_ls",
			"eslint",
			"dockerls",
			"html",
			"jsonls",
			"null_ls",
			"rust_analyzer",
			"lua_ls",
			"tsserver",
			"yamlls",
		}
		for _, server in ipairs(servers) do
			require("v.plugins.lsp." .. server).setup(on_attach, capabilities)
		end

		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })

		-- vim.diagnostic.config({
		-- 	virtual_text = {
		-- 		source = "always",
		-- 		prefix = "▎",
		-- 		spacing = 6,
		-- 	},
		-- 	float = {
		-- 		source = "always",
		-- 	},
		-- 	signs = true,
		-- 	underline = true,
		-- 	update_in_insert = false,
		-- 	severity_sort = true,
		-- })
	end,
}
