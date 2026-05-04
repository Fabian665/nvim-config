return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    init = function()
        -- auto-start highlights & indentation
        vim.api.nvim_create_autocmd("FileType", {
            desc = "User: enable treesitter highlighting",
            callback = function(ctx)
                -- highlights
                local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

                -- indent
                local noIndent = {}
                if hasStarted and not vim.list_contains(noIndent, ctx.match) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python", "bash" },
            callback = function()
                vim.treesitter.start()
                vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo[0][0].foldmethod = "expr"
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
                require("nvim-treesitter.parsers").asciidoc = {
                    install_info = {
                        url = "https://github.com/cathaysia/tree-sitter-asciidoc",
                        revision = "0ecc13042b7352ddc3f7b8b31432e262711d44e4",
                        location = "tree-sitter-asciidoc",
                        queries = "tree-sitter-asciidoc/queries",
                    },
                }
            end,
        })

        local parser_installed = {
            "python",
            "lua",
            "vim",
            "vimdoc",
            "markdown_inline",
            "markdown",
            "toml",
            "yaml",
            "bash",
            "asciidoc",
            "just",
            "go",
        }

        vim.defer_fn(function()
            require("nvim-treesitter").install(parser_installed)
        end, 1000)
        require("nvim-treesitter").update()
    end,
}
