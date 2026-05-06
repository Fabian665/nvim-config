vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

require("telescope").load_extension("harpoon")

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add file to harpoon" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function()
  harpoon:list():prev()
end, { desc = "Previous harpoon file" })
vim.keymap.set("n", "<C-n>", function()
  harpoon:list():next()
end, { desc = "Next harpoon file" })

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local make_finder = function()
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end
    return require("telescope.finders").new_table({
      results = file_paths,
    })
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = make_finder(),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_buffer_number, map)
        map(
          "i",
          "<M-d>", -- your mapping here
          function()
            local state = require("telescope.actions.state")
            local selected_entry = state.get_selected_entry()
            local current_picker = state.get_current_picker(prompt_buffer_number)

            -- harpoon:list():removeAt(selected_entry.index)
            table.remove(harpoon_files.items, selected_entry.index)
            current_picker:refresh(make_finder())
          end
        )
        return true
      end,
    })
    :find()
end

vim.keymap.set("n", "<C-e>", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
