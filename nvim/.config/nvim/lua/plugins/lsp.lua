return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- Disable pyright
                pyright = false,
                -- Enable basedpyright
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                autoImportCompletions = true,
                                diagnosticMode = "openFilesOnly",
                            },
                        },
                    },
                },
            },
        },
    },
}
