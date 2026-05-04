vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim", name = "conform" } })

local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    go = { "gofmt" },
    sh = { "shfmt" },
    markdown = { "rumdl" },
  },
  formatters = {
    shfmt = {
      append_args = { "--indent", "2" },
    },
    stylua = {
      append_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    },
  },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true, desc = "Format the current buffer or range" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.keymap.set({ "n", "v" }, "<leader>f", vim.cmd.Format, { desc = "Format buffer or selection" })
