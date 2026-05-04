vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-mini/mini.icons" },
})

local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup({
  triggers = {
    { "<auto>", mode = "nxso" },
    { "<leader>", mode = { "n", "x" } },
  },
})

wk.add({
  "<leader>?",
  function()
    wk.show({ global = false })
  end,
  desc = "Buffer Local Keymaps (which-key)",
})

-- I think this is slop (I let Codex generate strings for descriptions),
-- and he also did this...
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gh", group = "Git hunks" },
  { "<leader>p", group = "Project" },
  { "g", group = "LSP navigation" },
})

wk.add({
  mode = "x",
  { "<leader>p", group = "Paste" },
})
