vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

local flavour = require("catppuccin").flavour or vim.g.catppuccin_flavour or "mocha"
local O = require("catppuccin").options
local C = require("catppuccin.palettes").get_palette(flavour)
local transparent_bg = O.transparent_background and "NONE" or C.mantle

require("catppuccin").setup({
  auto_integrations = true,
  integrations = {
    gitsigns = true,
    blink_indent = true,
    blink_cmp = {
      enabled = true,
      style = "bordered",
    },
    lualine = {
      normal = {
        a = { bg = C.blue, fg = C.mantle, gui = "bold" },
        b = { bg = C.surface0, fg = C.blue },
        c = { bg = transparent_bg, fg = C.text },
      },

      insert = {
        a = { bg = C.green, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.green },
      },

      terminal = {
        a = { bg = C.green, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.green },
      },

      command = {
        a = { bg = C.peach, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.peach },
      },
      visual = {
        a = { bg = C.mauve, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.mauve },
      },
      replace = {
        a = { bg = C.red, fg = C.base, gui = "bold" },
        b = { bg = C.surface0, fg = C.red },
      },
      inactive = {
        a = { bg = transparent_bg, fg = C.blue },
        b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
        c = { bg = transparent_bg, fg = C.overlay0 },
      },
    },
  },
})
vim.cmd.colorscheme("catppuccin-nvim")
