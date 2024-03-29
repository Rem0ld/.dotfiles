_G.global = {}

global.user_terminals = {}

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()

--- Toggle a user terminal if it exists, if not then create a new one and save it
-- @param term_details a terminal command string or a table of options for Terminal:new() (Check toggleterm.nvim documentation for table format)
function global.toggle_term_cmd(opts)
	local terms = global.user_terminals
	-- if a command string is provided, create a basic table for Terminal:new() options
	if type(opts) == "string" then
		opts = { cmd = opts, hidden = true }
	end
	local num = vim.v.count > 0 and vim.v.count or 1
	-- if terminal doesn't exist yet, create it
	if not terms[opts.cmd] then
		terms[opts.cmd] = {}
	end
	if not terms[opts.cmd][num] then
		if not opts.count then
			opts.count = vim.tbl_count(terms) * 100 + num
		end
		terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
	end
	-- toggle the terminal
	global.user_terminals[opts.cmd][num]:toggle()
end

function global.get_short_file_path(path)
	local dirs = {}
	for dir in string.gmatch(path, "([^/]+)") do
		table.insert(dirs, dir)
	end

	local n = #dirs
	if n > 4 then
		return "../" .. dirs[n - 3] .. "/" .. dirs[n - 2] .. "/" .. dirs[n - 1] .. "/" .. dirs[n]
	end

	return path
end

function global.format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format(vim.tbl_deep_extend("force", {
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
	}, require("nvim-lspconfig").format or {}))
end

return global
