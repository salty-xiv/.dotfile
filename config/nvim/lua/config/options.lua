-- opts
local opts = {
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	expandtab = true,
	smartindent = true,

	wrap = false,

	termguicolors = true,
	guicursor = "",

	nu = true,
	number = true,
	relativenumber = true,

	foldlevel = 99,

	swapfile = false,
	backup = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	hlsearch = false,
	incsearch = true,

	scrolloff = 8,
	signcolumn = "yes",

	updatetime = 50,

	colorcolumn = "120",
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- global
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- autocmd
local augroup = vim.api.nvim_create_augroup
local PersonalGroup = augroup("Personal", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

autocmd({ "BufWritePre" }, { group = Personal, pattern = "*", command = [[%s/\s\+$//e]] })

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
