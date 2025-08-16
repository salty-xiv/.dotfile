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
	-- Linux
	-- undodir = os.getenv("HOME") .. "/.vim/undodir",
	-- Windows
	undodir = os.getenv("USERPROFILE") .. "/.vim/undodir",
	undofile = true,

	hlsearch = false,
	incsearch = true,

	scrolloff = 8,

	-- Reserve a space in the gutter
	-- This will avoid an annoying layout shift in the screen
	signcolumn = "yes",

	updatetime = 50,

	colorcolumn = "120",

	clipboard = "unnamedplus",
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- global
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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
