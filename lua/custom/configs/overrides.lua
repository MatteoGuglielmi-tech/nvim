local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"python",
		"latex",
		"bash",
		"c",
		"cpp",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		disable = {},
	},
}

M.mason = {
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"lua-language-server",
		"clangd",
		"pyright",
		"bashls",
		"texlab",
		"marksman",
	},
}

-- Add null-ls

M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
