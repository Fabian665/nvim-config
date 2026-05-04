vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Start netwr" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join with line below" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
vim.keymap.set("n", "n", "nzz", { desc = "Next search" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Move selection down" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to sys clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to sys clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete to null" })
vim.keymap.set({"n", "v"}, "<leader>c", [["_c]], { desc = "Replace to null" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action / Quick Fix" })
