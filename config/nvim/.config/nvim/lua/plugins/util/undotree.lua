local plug = { "mbbill/undotree" }

function plug.init()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return plug
