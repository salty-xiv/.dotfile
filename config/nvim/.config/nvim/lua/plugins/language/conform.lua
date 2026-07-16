local plug = { "stevearc/conform.nvim", opts = {} }

function plug.config()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier", stop_after_first = true },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      typescript = { "prettier" },
      yaml = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  })
end

return plug
