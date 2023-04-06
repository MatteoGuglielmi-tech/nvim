local M = {}

-- In order to disable a default keymap, use
M.disabled = {
    n = {
        ["<leader>e"] = "",
        ["<C-n>"] = "",
        ["<Esc>"] = { ":noh <CR>", "clear highlights" },
    },
}

M.general = {

    n = {
        -- source current file
        ["<leader><CR>"] = { "<cmd>source %<CR>", "Source current file" },
        ["<leader>y"] = { '"+y', "Copy text to system clipboard" },

        -- window splitting
        ["<leader>sv"] = { "<C-w>v", "split vertically" },
        ["<leader>so"] = { "<C-w>s", "split horizontally" },
        ["<leader>se"] = { "<C-w>=", "Make splitted windows the same dimensions" },

        -- window resizing
        ["<C-Up>"] = { ":resize +2<CR>", "Increase window height" },
        ["<C-Down>"] = { ":resize -2<CR>", "Decrease window height" },
        ["<C-Left>"] = { ":vertical resize +2<CR>", "Increase window width" },
        ["<C-Right>"] = { ":vertical resize -2<CR>", "Decrease window width" },
        ["<leader>co"] = { ":Copilot<CR>", "Copilot" },
    },

    i = {
        -- ESC
        ["jk"] = { "<ESC>", "Exit insert mode" },
    },

    v = {

        ["J"] = { ":m '>+1<CR>gv=gv", "Move line down" },
        ["K"] = { ":m '<-2<CR>gv=gv", "Move line up" },
        ["<leader>r"] = { '"_dP', "Replace selected text without yanking" },
        ["<leader>d"] = { '"-d', "Delete selected text without yanking" },
    },
}

M.lspconfig = {
    plugin = true,

    n = {
        ["<leader>rs"] = {
            ":LspRestart<CR>",
            "Restart LSP",
        },
    },
}

M.nvimtree = {
    plugin = true,
    n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    },
}

M.fugitive = {
    plugin = true,
    n = {
        ["<leader>gd"] = { ":Gdiffsplit<CR>", "Git diff" },
        ["<leader>gvd"] = { ":Gvdiffsplit<CR>", "Git vdiff" },
        ["<leader>gb"] = { ":Gblame<CR>", "Git blame" },
        ["<leader>gl"] = { ":Git pull<CR>", "Git pull" },
        ["<leader>gc"] = { ":Gcommit<CR>", "Git commit" },
        ["<leader>gs"] = { ":G<CR>", "Git status" },
        ["<leader>gp"] = { ":Git push<CR>", "Git push" },
        ["<leader>ga"] = { ":Gwrite<CR>", "Git add" },
    },
}

M.gv = {
    plugin = true,
    n = {
        ["<leader>gv"] = { ":GV<CR>", "Git history" },
        ["<leader>gvf"] = { ":GV!<CR>", "Git history current file" },
    },
}

return M
