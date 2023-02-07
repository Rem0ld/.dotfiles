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
        local lsp_formatting = function(bufnr)
            vim.lsp.buf.format({
                -- filter = function(client)
                -- 	-- apply whatever logic you want (in this example, we'll only use null-ls)
                -- 	return client.name == "null-ls"
                -- end,
                bufnr = bufnr,
            })
        end
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
            set_lsp_keymaps = { omit = { "<F2>", "<F4>" } }
        })

        lsp_zero.on_attach(function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local bind = vim.keymap.set

            bind("n", "<leader>lc", vim.lsp.buf.code_action, table.insert(opts, { desc = "Code action" }))
            bind("n", "<leader>lf", "<cmd>LspZeroFormat<cr>", table.insert(opts, { desc = "Format" }))
            bind("n", "<leader>lr", vim.lsp.buf.rename, table.insert(opts, { desc = "Rename" }))

            if client.server_capabilities.documentRangeFormattingProvider then

                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        lsp_formatting(bufnr)
                    end,
                })
                -- vim.cmd("autcmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms = 4000})")
            end
        end)

        lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
        })
    end,
}
