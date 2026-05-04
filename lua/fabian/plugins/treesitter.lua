return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "python", "bash", "ssh_config",
                "html", "dockerfile", "yaml", "css", "diff", "gitignore",
                "markdown", "nginx", "hcl", "terraform", "caddy"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.asciidoc = {
            install_info = {
                url = "https://github.com/cathaysia/tree-sitter-asciidoc", -- local path or git repo
                files = {"tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
                -- optional entries:
                generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
            },
            filetype = "adoc", -- if filetype does not match the parser name
        }
    end
}
