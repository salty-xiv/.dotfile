local plug = {"mfussenegger/nvim-lint"}

function plug.init()
    vim.api.nvim_create_autocmd({"BufWritePost"}, {
        callback = function()
            -- try_lint without arguments runs the linters defined in `linters_by_ft`
            -- for the current filetype
            require("lint").try_lint()
        end
    })
    vim.keymap.set("n", "<leader>ml", function() lint.try_lint() end,
                   {desc = "Trigger linting for current file"})
end

function plug.config()
    local lint = require("lint")
    lint.linters_by_ft = {
        lua = {"luacheck"}
        -- markdown = { "vale" },
        -- javascript = { "eslint_d" },
        -- typescript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
        -- svelte = { "eslint_d" },
        -- liquid = { "shopify-theme-check" },
        -- ruby = { "rubocop" },
        -- python = { "pylint" },
    }
end

return plug
