vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.indent",
})

local cmp = require("blink.cmp")

cmp.build():pwait()
cmp.setup({
  keymap = { preset = "default" },
  completion = {
    documentation = {
      auto_show = false,
      window = {
        border = "rounded",
      },
    },
    menu = { border = "rounded" },
  },
  signature = {
    window = {
      border = "rounded",
    },
  },
})
