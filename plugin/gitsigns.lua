vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" } })

require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "┆" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "]h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, { desc = "Next Hunk" })
    map("n", "[h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, { desc = "Prev Hunk" })

    map("n", "]H", function()
      gitsigns.nav_hunk("last")
    end, { desc = "Last Hunk" })
    map("n", "[H", function()
      gitsigns.nav_hunk("first")
    end, { desc = "First Hunk" })

    map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
    map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

    map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
    map("n", "<leader>ghu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
    map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
    map("n", "<leader>ghp", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })
    map("n", "<leader>ghb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "Blame Line" })

    map("n", "<leader>ghB", function()
      gitsigns.blame()
    end, { desc = "Blame Buffer" })

    map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff This" })
    map("n", "<leader>ghD", function()
      gitsigns.diffthis("~")
    end, { desc = "Diff This ~" })

    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })
  end,
})
