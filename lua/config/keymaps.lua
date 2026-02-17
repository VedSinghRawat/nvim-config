-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Insert mode
map("i", "fj", "<Esc>", { desc = "Exit insert mode" })
map("i", "dk", "<C-o>", { desc = "Execute one normal mode command" })

-- Normal mode
map("n", "<leader>sf", "<cmd>w<cr>", { desc = "Save file" })

-- Normal mode (non-recursive, centering after scroll)
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Operator-pending mode (shortcuts for inside text objects)
map("o", "(", "i(", { desc = "Inside parentheses" })
map("o", "[", "i[", { desc = "Inside brackets" })
map("o", "{", "i{", { desc = "Inside braces" })

local opts = { noremap = true, silent = true }

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  })
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)

-- Terminal mode
map("t", "qt", "<C-\\><C-n>", { desc = "Exit terminal mode to normal" })
