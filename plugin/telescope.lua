vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope live file find" })
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope live git files find" })
vim.keymap.set("n", "<leader>pws", function()
  local word = vim.fn.expand("<cword>")
  builtin.grep_string({ search = word })
end, { desc = "Telescope find files by current word" })
vim.keymap.set("n", "<leader>pWs", function()
  local word = vim.fn.expand("<cWORD>")
  builtin.grep_string({ search = word })
end, { desc = "Telescope find files by current WORD" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep, find files by content" })
