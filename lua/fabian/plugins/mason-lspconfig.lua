return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "ty",
            "ruff",
            "lua_ls",
            "yamlls",
            "bashls",
            "jsonls",
            "tombi",
        },
        automatic_enable = true,
    },
    dependencies = {
        { "KingMichaelPark/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
