return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	requires = { { "nvim-lua/plenary.nvim" } },
	opts = {
		defaults = {
			path_display = { "truncate" },
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
				},
			},
		},
	},
}
