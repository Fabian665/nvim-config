vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*Caddyfile",
  callback = function()
    vim.bo.filetype = "caddy"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function ()
        vim.opt_local.iskeyword:remove("_")
    end,
})
