return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	version = false,
	keys = {
		{
			"<leader>?",
			function()
				-- show the <leader> menu for NORMAL mode in the current buffer
				require("which-key").show({ keys = "<leader>", mode = "n", buffer = 0, global = false })
			end,
			desc = "WhichKey: <leader> (buffer-local)",
		},
	},
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		{ "nvim-mini/mini.icons", version = "*", opts = {} },
	},
}
