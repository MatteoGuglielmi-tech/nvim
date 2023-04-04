local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

-- servers configred with default features
local servers = { "marksman" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "pyright-langserver", "--stdio" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- options are "off", "basic", "strict"
                diagnosticMode = "workspace",
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                },
                -- set pyright to remove unused imports when saving
                autoImportCompletion = true,
            },
        },
    },
    single_file_support = true,
}

lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "texlab" },
    settings = {
        texlab = {
            build = {
                args = {
                    "-pdf",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f",
                },
                executable = "latexmk",
                onSave = true,
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = false,
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%1:1:%f", "%p" },
            },
            lint = {
                onChange = true,
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = true,
            },
        },
    },

    filetypes = { "tex", "bib", "plaintex" },
    single_file_support = true,
}
