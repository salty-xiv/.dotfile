local plug = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
}

function plug.init()
	-- See :help telescope.builtin
	vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>", { desc = "Search file history" })
	vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "Search open files" })
	vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Search all files" })
	vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search in project" })
	vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
	vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffer local search" })
	vim.keymap.set(
		"n",
		"<leader>ph",
		"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
		default_ops
	)
end

function plug.config()
	local telescope = require("telescope")
	telescope.setup({})
end

return plug
