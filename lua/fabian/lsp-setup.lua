vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- override open floating preview to add borders to floating windows
    local native_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"

      return native_util_open_floating_preview(contents, syntax, opts, ...)
    end

    map("n", "K", vim.lsp.buf.hover, "Show hover documentation")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "go", vim.lsp.buf.type_definition, "Go to type definition")
    map("n", "gr", vim.lsp.buf.references, "Show references")
    map("n", "gs", vim.lsp.buf.signature_help, "Show signature help")
    map("n", "gl", vim.diagnostic.open_float, "Show line diagnostics")
    map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
    -- map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end)
    map("n", "<F4>", vim.lsp.buf.code_action, "Code action")

    if client.name == "ruff" then
      -- Disable hover in favour of Pyright
      client.server_capabilities.hoverProvider = false
    end

    if client:supports_method("textDocument/documentHighlight") then
      local highlight_augroup = vim.api.nvim_create_augroup("my.lsp.highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.lsp.enable("bashls")
vim.lsp.enable("gopls")
vim.lsp.enable("harper-ls")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
vim.lsp.enable("rumdl")
vim.lsp.enable("tombi")
vim.lsp.enable("yamlls")
