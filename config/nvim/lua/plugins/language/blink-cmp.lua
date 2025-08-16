local plug = {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets", "folke/lazydev.nvim" },

	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "default" },
		completion = {
			list = {
				cycle = { from_top = false }, -- cycle at bottom, but not at the top
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1000,
				window = {
					-- border = { " ", " ", " ", " ", " ", " ", " ", " " },
					max_width = 50,
					max_height = 15,
				},
			},
			menu = {
				-- border = { " ", " ", " ", " ", " ", " ", " ", " " },
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					columns = { { "kind_icon", gap = 1 }, { "label", gap = 1 }, { "source_name" } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
						source_name = {
							width = { max = 30, fill = true },
							text = function(ctx)
								if ctx.item.source_id == "lsp" then
									local client = vim.lsp.get_client_by_id(ctx.item.client_id)
									if client ~= nil then
										return string.format("[%s]", client.name)
									end
									return ctx.source_name
								end

								return ctx.source_name
							end,
							highlight = "BlinkCmpSource",
						},
					},
				},
			},
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}

return plug
