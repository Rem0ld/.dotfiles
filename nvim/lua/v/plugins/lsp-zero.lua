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
		lsp_zero.setup()
	end,
}
