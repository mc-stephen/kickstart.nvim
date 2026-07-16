vim.pack.add {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('snacks').setup {
  image = { enabled = true },
  lazygit = { enabled = true },
  terminal = { enabled = true },
  explorer = { enabled = true },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        layout = {
          preview = 'main', -- Instantly shows the preview panel by default!
          preset = 'sidebar', -- Keeps it docked as a sidebar
        },
      },
    },
  },
}

-- Open Snacks Explorer (Your sidebar)
vim.keymap.set('n', '<leader>e', function() require('snacks').explorer() end, { desc = 'Toogle Snacks Explorer' })

-- 2. Open Lazygit in a gorgeous floating terminal frame
vim.keymap.set('n', '<leader>gg', function() require('snacks').lazygit.open() end, { desc = 'Open Lazygit Overlay' })
