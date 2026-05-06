# nvim-config

The main goal is to have a (relatively) minimal setup, but with coding QoL tools.

## Prerequisites

- [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
- A C compiler in your path and libstdc++ installed
- For LSP and formatters support, install the used LSPs mentioned in the
[`lsp` directory](lsp/) and the formatters mentioned in [Conform's config](plugin/conform.lua)
  - [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
    - [harper-ls](https://rumdl.dev/getting-started/installation/#__tabbed_1_2) (Other means of installing exist)
    - [rumdl](https://rumdl.dev/getting-started/installation/#__tabbed_1_2) (Other means of installing exist)
    - [stylua](https://github.com/JohnnyMorganz/StyLua#from-cratesio)
  - [go](https://go.dev/doc/install)
    - gofmt (Installed with `go`)
    - [gopls](https://go.dev/gopls/#installation)
    - [yamlfmt](https://github.com/google/yamlfmt#installation)
    - [yamlls](https://github.com/redhat-developer/yaml-language-server)
  - [lua-ls](https://luals.github.io/#neovim-install) (I dislike the available package managers)
  - [shfmt](https://webinstall.dev/shfmt/)
  - [npm and node](https://nodejs.org/en/download)
    - [bashls](https://github.com/bash-lsp/bash-language-server#bash-language-server-1)
    - [pyright](https://github.com/microsoft/pyright/blob/main/docs/installation.md#npm-package)
  - [uv](https://docs.astral.sh/uv/getting-started/installation/)
    - [ruff](https://docs.astral.sh/ruff/installation/) (Also available without a package manager)
    - [tombi](https://tombi-toml.github.io/tombi/docs/installation#global-installation) (Also available without a package manager)
- More(?)

## Install

### Windows

> [!NOTE]
> Not yet tested on Windows

#### PowerShell

```sh
git clone https://github.com/Fabian665/nvim-config.git $HOME\\Appdata\\Local\\nvim
```

#### CMD

```sh
git clone https://github.com/Fabian665/nvim-config.git %USERPROFILE%\\Appdata\\Local\\nvim
```

### Linux

```sh
git clone https://github.com/Fabian665/nvim-config.git ~/.config/nvim
```
