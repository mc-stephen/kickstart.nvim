vim.pack.add {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons', 
}

require('snacks').setup({
  explorer = { enabled = true },
  picker = { enabled = true },
})

-- Using require('snacks') explicitly makes the LSP warning disappear completely
vim.keymap.set('n', '<leader>e', function()
  require('snacks').explorer()
end, { desc = 'Open Snacks Explorer with Top Search Bar' })
