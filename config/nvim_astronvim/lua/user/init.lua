--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the

-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = false, -- automatically reload and sync packer after a successful update
		auto_quit = false, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Override highlight groups in any theme
	highlights = {
		-- duskfox = { -- a table of overrides/changes to the default
		--   Normal = { bg = "#000000" },
		-- },
		default_theme = function(highlights) -- or a function that returns a new table of colors to set
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
		-- tokyonight = function(highlights)
		-- 	local C = require("tokyonight-storm.colors")
		--
		-- 	highlights.Normal = { fg = C.fg, bg = "none" }
		-- 	return highlights
		-- end,
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},
	-- If you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- Set dashboard header
	header = {
		" █████  ███████ ████████ ██████   ██████",
		"██   ██ ██         ██    ██   ██ ██    ██",
		"███████ ███████    ██    ██████  ██    ██",
		"██   ██      ██    ██    ██   ██ ██    ██",
		"██   ██ ███████    ██    ██   ██  ██████",
		" ",
		"    ███    ██ ██    ██ ██ ███    ███",
		"    ████   ██ ██    ██ ██ ████  ████",
		"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
		"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
		"    ██   ████   ████   ██ ██      ██",
	},

	-- Default theme configuration
	default_theme = {
		-- set the highlight style for diagnostic messages
		diagnostics_style = { italic = true },
		-- Modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		-- enable or disable highlighting for extra plugins
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({...}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- Extend LSP configuration
	lsp = {
		skip_setup = {
			"tsserver",
			"rust_analyzer",
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			eslint_d = {
				filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
				cmd = { "vscode-eslint-language-server", "--stdio" },
			},
			-- tsserver = {
			-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
			-- 	root_dir = function()
			-- 		return vim.loop.cwd()
			-- 	end,
			-- },
			-- example for addings schemas to yamlls
			-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
			-- Example disabling formatting for a specific language server
			-- gopls = { -- override table for require("lspconfig").gopls.setup({...})
			-- 	on_attach = function(client, bufnr)
			-- 		client.server_capabilities.document_formatting = false
			-- 	end,
			-- },
		},
	},

	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	mappings = {
		-- first key is the mode
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "Buffer"
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "go to next buffer" },
			["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = " go to previous buffer" },

			-- Move lines
			["<leader>j"] = { ":m .+1<cr>==", desc = "Move 1 down" },
			["<leader>k"] = { ":m .-2<cr>==", desc = "Move 1 up" },

			-- Vimrc user
			["<leader>vm"] = { ":vsp ~/.config/nvim/lua/user/init.lua<cr>", desc = "edit vimrc user" },
			["<leader>sv"] = { ":source ~/.config/nvim/lua/user/init.lua<cr>", desc = "source vimrc user" },

			-- Keep cursor at the center of the screen
			["<C-d>"] = { "<C-d>zz" },
			["<C-u"] = { "<C-u>zz" },
			["n"] = { "nzzzv" },
			["N"] = { "Nzzzv" },
			["<leader>gg"] = {
				function()
					astronvim.toggle_term_cmd("gitui")
				end,
				desc = "ToggleTerm gitui",
			},
			["<leader>lg"] = {
				function()
					require("logsitter").log()
				end,
			},

			-- Quickfix list
			["[q"] = { ":cp<cr><cr>", desc = "go previous item in quickfix list" },
			["]q"] = { ":cn<cr><cr>", desc = "go next item in quickflix lst" },

			-- Makes delete better
			["<leader>d"] = { '"_d' },

			-- Telescope
			["<leader>fg"] = {
				"<cmd>Telescope git_files<cr>",
				desc = "Search Git files",
			},

			-- quick save
			-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		},
		i = {
			["kj"] = { "<esc>", desc = "Back to normal mode" },
			["jj"] = { "<esc>", desc = "Back to normal mode" },
			["kk"] = { "<esc>", desc = "Back to normal mode" },
			["jk"] = { "<esc>", desc = "Back to normal mode" },
			["C-k"] = { "<esc>:m .-2<cr>==gi", desc = "Move 1 up" },
			["C-j"] = { "<esc>:m .+1<cr>==gi", desc = "Move 1 down" },
		},
		v = {
			["J"] = { ":m '>+1<cr>gv=gv", desc = "Move line 1 down" },
			["K"] = { ":m '<-2<cr>gv=gv", desc = "Move line 1 up" },

			-- Makes delete better
			["<leader>d"] = { '"_d' },
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
	},

	-- Configure plugins
	plugins = {
		init = {
			-- Disabling stuff here

			-- ["lewis6991/gitsigns.nvim"] = { disable = true },
			["declancm/cinnamon.nvim"] = { disable = true },

			-- Pin version here
			["rebelot/heirline.nvim"] = { commit = "556666a" },

			-- Theme here

			["folke/tokyonight.nvim"] = {
				config = function()
					require("tokyonight").setup()
				end,
			},
			{ "EdenEast/nightfox.nvim" },
			-- { "ludovicchabant/vim-gutentags" }, eat too much ram

			-- Other plugins here

			{ "gpanders/editorconfig.nvim" },
			{ "gaelph/logsitter.nvim" },

			["kylechui/nvim-surround"] = {
				tag = "*",
				config = function()
					require("nvim-surround").setup()
				end,
			},

			-- SPECIFIC LSP SERVER

			{
				"simrat39/rust-tools.nvim",
				after = "mason-lspconfig.nvim",
				config = function()
					require("rust-tools").setup({
						server = astronvim.lsp.server_settings("rust_analyzer"),
					})
				end,
			},
			-- {
			-- 	"MunifTanjim/eslint.nvim",
			-- 	after = { "mason-lspconfig.nvim" },
			-- 	config = function()
			-- 		require("eslint").setup({
			-- 			bin = "eslint_d", -- or `eslint_d`
			-- 			server = astronvim.lsp.server_settings("tsserver"),
			-- 			code_actions = {
			-- 				enable = true,
			-- 				apply_on_save = {
			-- 					enable = true,
			-- 					types = { "directive", "problem", "suggestion", "layout" },
			-- 				},
			-- 				disable_rule_comment = {
			-- 					enable = true,
			-- 					location = "separate_line", -- or `same_line`
			-- 				},
			-- 			},
			-- 			diagnostics = {
			-- 				enable = true,
			-- 				report_unused_disable_directives = false,
			-- 				run_on = "type", -- or `save`
			-- 			},
			-- 			formatting = {
			-- 				enable = false,
			-- 			},
			-- 		})
			-- 	end,
			-- },
			--
			-- SPECIFIC LSP SERVER END

			-- TREESITTER

			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "nvim-treesitter/playground" },

			["nvim-neo-tree/neo-tree.nvim"] = {
				config = function()
					require("neo-tree").setup({
						close_if_last_window = true,
						filesystem = {
							filtered_items = {
								visible = false, -- when true, they will just be displayed differently than normal items
								hide_dotfiles = false,
								hide_gitignored = false,
								hide_hidden = false, -- only works on Windows for hidden files/directories
							},
							follow_current_file = true,
						},
					})
				end,
			},

			{
				"jose-elias-alvarez/typescript.nvim",
				after = "mason-lspconfig.nvim",
				config = function()
					require("typescript").setup({
						server = astronvim.lsp.server_settings("tsserver"),
					})
				end,
			},
			-- TREESITTER END

			-- AUTOCOMPLETION IA

			{ "github/copilot.vim" },

			-- AUTOCOMPLETION IA END
			-- {
			-- 	"tzachar/cmp-tabnine",
			-- 	setup = function()
			-- 		require("user.plugins.tabnine").config()
			-- 	end,
			-- },
		},
		["bufferline"] = function(config)
			config.options = {
				separator_style = "slant",
				indicator = {
					style = "underline",
				},
			}
			config.highlights = {
				buffer_selected = {
					fg = "#FF80A0",
					bg = "#1E2430",
					sp = "#FF80A0",
					bold = true,
					italic = true,
					underdouble = true,
					underline = true,
				},
				indicator_selected = {
					fg = "#F7CAB8",
					bg = "#1E2430",
					sp = "#FF80A0",
					bold = true,
					underdouble = true,
					underline = true,
				},
			}

			return config
		end,
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config variable is the default configuration table for the setup functino call
			local null_ls = require("null-ls")
			-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
			local group = vim.api.nvim_create_augroup("lsp_format_on_save", {})
			local event = "BufWritePre" -- or "BufWritePost"
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- 	-- Set a formatter
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.stylua,

				-- null_ls.builtins.diagnostics.markdownlint,
			}
			config.debug = true
			-- set up null-ls's on_attach function
			-- NOTE: You can remove this on attach function to disable format on save
			config.on_attach = function(client, bufnr)
				if client.name == "tsserver" then
					client.resolved_capabilities.document_formatting = false
				end

				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = group,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(cl)
									return cl.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end

				-- if client.supports_method("textDocument/rangeFormatting") then
				-- 	vim.keymap.set("x", "<Leader>f", function()
				-- 		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
				-- 	end, { buffer = bufnr, desc = "[lsp] format" })
				-- end
			end
			return config -- return final config table to use in require("null-ls").setup(config)
		end,
		treesitter = { -- overrides `require("treesitter").setup(...)`
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"rust",
			},
			autotag = {
				enable = true,
			},
			auto_install = true,
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			ensure_installed = { "sumneko_lua", "tsserver", "html", "cssls", "jsonls", "yamlls", "rust_analyzer" },
			automatic_installation = true,
		},
		-- use mason-tool-installer to configure DAP/Formatters/Linter installation
		["mason-null-ls"] = {
			ensure_installed = { "prettier", "eslint_d", "stylua" },
			automatic_installation = true,
			setup_handlers = {
				-- 	-- For prettierd:
				prettier = function()
					require("null-ls").register(require("null-ls").builtins.formatting.prettier.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
									or utils.root_has_file(".prettierrc")
									or utils.root_has_file(".prettierrc.json")
									or utils.root_has_file(".prettierrc.js")
						end,
					}))
				end,
				-- 	-- For eslint_d:
				eslint_d = function()
					require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
									or utils.root_has_file(".eslintrc.json")
									or utils.root_has_file(".eslintrc.js")
						end,
					}))
				end,
			},
		},

		["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
			ensure_installed = { "prettier", "eslint" },
		},
		packer = { -- overrides `require("packer").setup(...)`
			compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
		},
	},

	-- colorscheme = "tokyonight-storm",
	colorscheme = "nightfox",

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			cmp_tabnine = 900,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
		sources = {
			{ name = "cmp_tabnine" },
		},
	},

	-- Modify which-key registration (Use this with mappings table in the above.)
	["which-key"] = {
		-- Add bindings which show up as group name
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- third key is the key to bring up next level and its displayed
					-- group name in which-key top level menu
					["b"] = { name = "Buffer" },
				},
			},
		},
	},

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set key binding
		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		-- Toggle transparent background
		vim.t.is_transparent = 0
		local function toggle_transparent()
			if vim.t.is_transparent == 0 then
				vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
				vim.t.is_transparent = 1
			else
				vim.opt.background = "dark"
				vim.t.is_transparent = 0
			end
		end

		vim.keymap.set("n", "<leader>vb", toggle_transparent)

		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
