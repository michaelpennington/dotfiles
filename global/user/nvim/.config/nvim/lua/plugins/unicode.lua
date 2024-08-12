return {
  "cosmicboots/unicode_picker.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local up = require("unicode_picker")
    up.setup()
    vim.keymap.set("i", "<C-j>", up.unicode_chars, {})
  end,
}
