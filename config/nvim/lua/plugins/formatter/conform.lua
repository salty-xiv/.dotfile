local plug = {"stevearc/conform.nvim", opts = {}}

-- function plug.init()
-- end

function plug.config()
    local conform = require("conform")
    conform.setup({
        formatters_by_ft = {
            -- lua = { "stylua" },
            lua = {"lua-format"},
            nix = {"nixfmt"}
            -- cs = { "nixpkgs_fmt" },
            -- Conform will run multiple formatters sequentially
            -- python = {"isort", "black"},
            -- You can customize some of the format options for the filetype (:help conform.format)
            -- rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
            -- typescript = { "prettier" },
            -- javascriptreact = { "prettier" },
            -- typescriptreact = { "prettier" },
            -- svelte = { "prettier" },
            -- css = { "prettier" },
            -- html = { "prettier" },
            -- json = { "prettier" },
            -- yaml = { "prettier" },
            -- markdown = { "prettier" },
            -- graphql = { "prettier" },
            -- ruby = { "rubocop" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback"
        }
    })
end

return plug
