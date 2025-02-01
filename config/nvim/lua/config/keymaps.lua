local map = require("helpers.keys").map

-- keybind to open explorer menu
map("n", "<leader>pv", vim.cmd.Ex, "Open Explorer")

-- Diagnostic keymaps
map("n", "gx", vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")

if vim.g.vscode then
    -- VSCode Neovim
    -- yank to system clipboard
    -- keymap({ "n", "v" }, "<leader>y", '"+y', opts)
    -- map({ "n", "v" }, "<leader>y", '"+y')

    -- -- paste from system clipboard
    -- keymap({ "n", "v" }, "<leader>p", '"+p', opts)
    -- map({ "n", "v" }, "<leader>p", '"+p')

    -- better indent handling
    -- keymap("v", "<", "<gv", opts)
    -- keymap("v", ">", ">gv", opts)

    -- -- move text up and down
    -- keymap("v", "J", ":m .+1<CR>==", opts)
    -- keymap("v", "K", ":m .-2<CR>==", opts)
    -- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
    -- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

    -- -- paste preserves primal yanked piece
    -- keymap("v", "p", '"_dP', opts)

    -- -- removes highlighting after escaping vim search
    -- keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)
else
    -- Ordinary Neovim

    -- while highlighted use J and K to move selected lines
    map("v", "J", ":m '>+1<CR>gv=gv", "Move line up")
    map("v", "K", ":m '<-2<CR>gv=gv", "Move Line down")

    -- modifies J to append the next line to current without moving to end of line
    map("n", "J", "mzJ`z", "Append Next Line")

    -- Easier access to beginning and end of lines
    map("n", "<M-h>", "^", "Go to beginning of line")
    map("n", "<M-l>", "$", "Go to end of line")

    -- modifies so half page holds cursor close to middle
    map("n", "<C-d>", "<C-d>zz", "Scroll up")
    map("n", "<C-u>", "<C-u>zz", "Scroll down")

    -- modifies so searching holds cursor close to middle
    map("n", "n", "nzzzv", "Search next")
    map("n", "N", "Nzzzv", "Search Previous")

    -- Better window navigation
    -- map("n", "<C-S-h>", "<C-w><C-h>", "Navigate windows to the left")
    -- map("n", "<C-S-j>", "<C-w><C-j>", "Navigate windows down")
    -- map("n", "<C-S-k>", "<C-w><C-k>", "Navigate windows up")
    -- map("n", "<C-S-l>", "<C-w><C-l>", "Navigate windows to the right")

    -- Navigate buffers
    map("n", "<S-l>", ":bnext<CR>")
    map("n", "<S-h>", ":bprevious<CR>")

    -- Stay in indent mode
    map("v", "<", "<gv")
    map("v", ">", ">gv")

    -- this pastes the current register without overwriting the current buffer
    map("x", "<leader>p", [["_dP]], "paste")

    -- next greatest remap ever : asbjornHaland
    -- yanks/copies into the global vim register
    map({ "n", "v" }, "<leader>y", [["+y]], "yank")
    map("n", "<leader>Y", [["+Y]], "yank2")

    -- deletes into void without affect register
    map({ "n", "v" }, "<leader>d", [["_d]])

    -- This is going to get me cancelled
    -- There's 1 feature thats hardcoded for esc vs ctrl c. this just makes them interchangeable
    map("i", "<C-c>", "<Esc>", "Crtl c remap")

    -- disables Q
    map("n", "Q", "<nop>", "disable Q")

    -- quick search and replace
    map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace")

    -- Clear after search
    map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

    -- will allow tmux to switch projects
    map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Allow Tmux switch")

    -- format text
    map("n", "<leader>mf", vim.lsp.buf.format, "Format")

    -- quick fix -- IDR what this does
    map("n", "<C-n>", "<cmd>cnext<CR>zz")
    map("n", "<C-m>", "<cmd>cprev<CR>zz")
    map("n", "<leader>k", "<cmd>lnext<CR>zz")
    map("n", "<leader>j", "<cmd>lprev<CR>zz")
end
