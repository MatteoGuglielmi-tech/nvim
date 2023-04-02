local overrides = require "custom.configs.overrides"

local plugins = {
    -- overrides plugin definition options
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    -- override plugin config
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- install plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup {
                mapping = { "jk" },
                timeout = vim.o.timeoutlen,
                clear_empty_lines = false,
                keys = "<Esc>",
            }
        end,
    },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require "custom.configs.null-ls"
            require("mason-null-ls").setup {
                ensure_installed = {
                    ensure_installed = {
                        -- formatters
                        "clang_format",
                        "stylua",
                        "black",
                        "isort",

                        -- linters
                        "gitlint",
                        "cpplint",
                        "flake8",
                        "shellcheck",
                        "cspell",
                    },
                    automatic_installation = true,
                },
            }
        end,
    },

    {
        "HiPhish/nvim-ts-rainbow2",
        lazy = false, -- important to have immediate effects
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-treesitter.configs").setup {
                rainbow = {
                    enable = true,
                    -- list of languages you want to disable the plugin for
                    disable = {},
                    -- Which query to use for finding delimiters
                    query = "rainbow-parens",
                    -- Highlight the entire buffer all at once
                    strategy = require("ts-rainbow").strategy.global,
                },
            }
        end,
    },

    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.g.copilot_fileypes = { xml = false, markdown = false, latex = false }
            vim.cmd [[ highlight CopilotSuggestions guifg=#555555 ctermfg=8]]
        end,
    },

    {
        "tpope/vim-fugitive",
        --lazy = false,  -- not essential since lazy loading allows to load the plugin when needed (i.e. when gv is called)
        config = function()
            require("core.utils").load_mappings "fugitive" -- manually load mappings for fugitive -- IMPORTANT
        end,
    },

    {
        "junegunn/gv.vim",
        dependencies = {
            "tpope/vim-fugitive",
        },
        lazy = false, -- important to start using the plugin immediately
        config = function()
            require("core.utils").load_mappings "gv"
        end,
    },
}

return plugins
