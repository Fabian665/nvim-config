return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = 'master',
        event = { "BufReadPost", "BufNewFile" },
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
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- like targets.vim
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",
                        ["aa"] = "@assignment.outer",
                        ["ia"] = "@assignment.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        -- Calls and arguments are useful in Python method chains
                        ["aC"] = "@call.outer",
                        ["iC"] = "@call.inner",
                        ["aA"] = "@argument.outer",
                        ["iA"] = "@argument.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]]"] = "@class.outer",
                        ["]a"] = "@parameter.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]}"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[["] = "@class.outer",
                        ["[a"] = "@parameter.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[{"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sn"] = "@parameter.inner",
                        ["<leader>sN"] = "@argument.inner",
                    },
                    swap_previous = {
                        ["<leader>sp"] = "@parameter.inner",
                        ["<leader>sP"] = "@argument.inner",
                    },
                },
                lsp_interop = {
                    enable = false,
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
