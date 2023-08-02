return {
	"stevearc/dressing.nvim",
	config = function()
		require("dressing").setup({
			input = {
				-- Set to `false` to disable
				mappings = {
					n = {
						["<Esc>"] = "Close",
						["<CR>"] = "Confirm",
						["k"] = "HistoryPrev",
						["j"] = "HistoryNext",
					},
					i = {
						["<C-c>"] = "Close",
						["<CR>"] = "Confirm",
						["<Up>"] = "HistoryPrev",
						["<Down>"] = "HistoryNext",
						-- Not working don't know why
						-- ["<C-k>"] = "HistoryPrev",
						-- ["<C-j>"] = "HistoryNext",
					},
				},
			},
		})
	end,
	-- opts = {
	-- },
}
