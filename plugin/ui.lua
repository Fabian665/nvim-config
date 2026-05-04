vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
})

require("fidget").setup({
  notification = {
    override_vim_notify = true,
  },
})
