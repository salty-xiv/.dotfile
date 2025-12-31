local plug = {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/lazydev.nvim" },
}
function plug.config()
	require("lazydev").setup({
		library = { "nvim-dap-ui" },
	})
end

return plug
