local config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			borderchars = { "" },
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
	},
	config = config,
}
