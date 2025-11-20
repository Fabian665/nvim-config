return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "ty",
            "ruff",
            "lua_ls",
            "stylua",
            "yamlls",
            "bashls",
            "jsonls",
            "tombi",
        },
        automatic_enable = {
            exclude = {
                "pyright",
            },
        },
    },
    dependencies = {
        { "KingMichaelPark/mason.nvim", opts = { pip = { use_uv = true } } },
        "neovim/nvim-lspconfig",
    },
}
