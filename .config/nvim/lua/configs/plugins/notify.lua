return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			timeout = 1500,
			render = "compact",
			minimum_width = 30,
		})
	end,
}
