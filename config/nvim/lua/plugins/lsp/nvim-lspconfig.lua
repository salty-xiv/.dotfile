local plug = {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { { "hrsh7th/cmp-nvim-lsp" } },
}

plug.init = function()
	-- Reserve a space in the gutter
	-- This will avoid an annoying layout shift in the screen
	vim.opt.signcolumn = "yes"

	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.lua_ls.setup({
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/love2d/library",

						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					}, -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
					-- library = vim.api.nvim_get_runtime_file("", true)
				},
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim", "table", "love" },
					disable = { "lowercase-global", "duplicate-set-field" },
				},
				capabilities = lsp_capabilities,
			})
		end,
		settings = {
			Lua = {},
		},
	})
end

function plug.config()
	local lsp_defaults = require("lspconfig").util.default_config

	-- Add cmp_nvim_lsp capabilities settings to lspconfig
	-- This should be executed before you configure any language server
	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- LspAttach is where you enable features that only work
	-- if there is a language server active in the file
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local opts = { buffer = event.buf }

			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
			vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		end,
	})
	vim.api.nvim_create_autocmd("LspDetach", {
		callback = function(args)
			-- Get the detaching client
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			-- Remove the autocommand to format the buffer on save, if it exists
			if client:supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					event = "BufWritePre",
					buffer = args.buf,
				})
			end
		end,
	})
end

return plug
