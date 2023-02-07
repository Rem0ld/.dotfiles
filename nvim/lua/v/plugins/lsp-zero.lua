return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.preset("recommended")
		lsp_zero.ensure_installed({
			"bashls",
			"cssls",
			"dockerls",
			"html",
			"jsonls",
			"rust_analyzer",
			"sumneko_lua",
			"tsserver",
			"yamlls",
		})
		lsp_zero.nvim_workspace()

        lsp_zero.set_preferences({
            set_lsp_keymaps = {omit = { "<F2>", "<F4>"}}
        })

        lsp_zero.on_attach(function (client, bufnr)
            local opts = {buffer = bufnr}
            local format = global.format
            local bind = vim.keymap.set

            bind("n", "<leader>lc", vim.lsp.buf.code_action, {desc = "Code action"} )
            bind("n", "<leader>lf", format, {desc = "Format"} )
            bind("n", "<leader>lr", vim.lsp.buf.rename, {desc = "Rename"} )
            
        end)
		lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
	end,
}
