local plug = {
	"karb94/neoscroll.nvim",
	opts = {},
}

function plug.config()
	local neo = require("neoscroll")
	neo.setup({
		mappings = { "<C-u>", "<C-d>" },
	})
end

return plug
