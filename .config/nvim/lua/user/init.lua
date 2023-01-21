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
			"tsserver", "rust_analyzer"
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
		on_attach = function(client, bufnr)
			if client.name == "tailwindcss" then
				require("tailwindcss-colors").buf_attach(bufnr)
			end
		end,

		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			tsserver = {
				-- filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
				root_dir = function()
					return vim.loop.cwd()
				end,
			},
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
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "go to next buffer" },
			["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = " go to previous buffer" },
			["<leader>j"] = { ":m .+1<cr>==", desc = "Move 1 down" },
			["<leader>k"] = { ":m .-2<cr>==", desc = "Move 1 up" },
			["<leader>vm"] = { ":vsp ~/.config/nvim/lua/user/init.lua<cr>", desc = "edit vimrc user" },
			["<leader>sv"] = { ":source ~/.config/nvim/lua/user/init.lua<cr>", desc = "source vimrc user" },
			-- Keep cursor at the center of the screen
			["<C-d>"] = { "<C-d>zz" },
			["<C-u"] = { "<C-u>zz" },
			["n"] = { "nzzzv" },
			["N"] = { "Nzzzv" },
			-- ["gd"] = { "gd<cr><cmd>:norm zz" },
			["[q"] = { ":cp<cr><cr>", desc = "go previous item in quickfix list" },
			["]q"] = { ":cn<cr><cr>", desc = "go next item in quickflix lst" },

			-- Makes delete better
			["<leader>d"] = { '"_d' },

			-- quick save
			-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		},
		i = {
			["kj"] = { "<esc>", desc = "Back to normal mode" },
			["jj"] = { "<esc>", desc = "Back to normal mode" },
			["jk"] = { "<esc>", desc = "Back to normal mode" },
			-- ["C-k"] = { "<esc>:m .-2<cr>==gi", desc = "Move 1 up" },
			-- ["C-j"] = { "<esc>:m .+1<cr>==gi", desc = "Move 1 down" },
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

			-- Theme here

			["folke/tokyonight.nvim"] = {
				config = function()
					require("tokyonight").setup()
				end,
			},
			{ "EdenEast/nightfox.nvim" },

			-- Other plugins here

			["rebelot/heirline.nvim"] = { commit = "556666a" },

			["kylechui/nvim-surround"] = {
				tag = "*",
				config = function()
					require("nvim-surround").setup()
				end,
			},
			{ "nvim-treesitter/nvim-treesitter-context" },
			["themaxmarchuk/tailwindcss-colors.nvim"] = {
				config = function()
					require("tailwindcss-colors").setup()
				end,
			},
			["nvim-neo-tree/neo-tree.nvim"] = {
				config = function()
					require("neo-tree").setup({
						filesystem = {
							filtered_items = {
								visible = false, -- when true, they will just be displayed differently than normal items
								hide_dotfiles = false,
								hide_gitignored = false,
								hide_hidden = false, -- only works on Windows for hidden files/directories
							},
						},
					})
				end,
			},
			{ "github/copilot.vim" },
			-- ["tzachar/cmp-tabnine"] = {
			-- 	requires = "hrsh7th/nvim-cmp",
			-- 	run = "./install.sh",
			-- 	rtp = "~/.local/share/nvim/site/pack/packer/start/cmp-tabnine/lua/cmp_tabnine",
			-- 	config = function()
			-- 		require("cmp-tabnine").setup({
			-- 			max_lines = 1000,
			-- 			max_num_results = 20,
			-- 			sort = true,
			-- 			run_on_every_keystroke = true,
			-- 			snippet_placeholder = "..",
			-- 			ignored_file_types = {
			-- 				-- default is not to ignore
			-- 				-- uncomment to ignore in lua:
			-- 				-- lua = true
			-- 			},
			-- 			show_prediction_strength = false,
			-- 		})
			-- 	end,
			-- },

			-- You can also add new plugins here as well:
			-- Add plugins, the packer syntax without the "use"
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },

			-- We also support a key value style plugin definition similar to NvChad:
			-- ["ray-x/lsp_signature.nvim"] = {
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			{ "simrat39/inlay-hints.nvim" },
			{
				"simrat39/rust-tools.nvim",
				after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
				config = function()
					require("rust-tools").setup {
						tools = {
							inlay_hints = {
								auto = false,
								only_current_line = true
							}

						},
						server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
					}
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
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- 	-- Set a formatter
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.formatting.stylua,
			}
			-- set up null-ls's on_attach function
			-- NOTE: You can remove this on attach function to disable format on save
			config.on_attach = function(client)
				if client.server_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.format,
					})
				end
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
			ensure_installed = { "lua", "tsx", "json", "yaml", "css", "html", "rust" },
			autotag = {
				enable = true,
			},
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			ensure_installed = { "sumneko_lua", "tsserver", "rust_analyzer" },
		},
		-- ["mason-null-ls"] = {
		-- setup_handlers = {
		-- 	-- For prettierd:
		-- 	prettierd = function()
		-- 		require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with({
		-- 			condition = function(utils)
		-- 				return utils.root_has_file("package.json")
		-- 						or utils.root_has_file(".prettierrc")
		-- 						or utils.root_has_file(".prettierrc.json")
		-- 						or utils.root_has_file(".prettierrc.js")
		-- 			end,
		-- 		}))
		-- 	end,
		-- 	-- For eslint_d:
		-- 	eslint_d = function()
		-- 		require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
		-- 			condition = function(utils)
		-- 				return utils.root_has_file("package.json")
		-- 						or utils.root_has_file(".eslintrc.json")
		-- 						or utils.root_has_file(".eslintrc.js")
		-- 			end,
		-- 		}))
		-- 	end,
		-- },
		-- },
		-- use mason-tool-installer to configure DAP/Formatters/Linter installation
		-- ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
		-- 	ensure_installed = { "prettierd", "eslint" },
		-- },
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
			luasnip = 750,
			buffer = 500,
			path = 250,
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
