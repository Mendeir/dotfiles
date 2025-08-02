return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
        },
        formatters = {
            prettier = {
                prepend_args = { "--tab-width", "4" },
            },
        },
    },
}
