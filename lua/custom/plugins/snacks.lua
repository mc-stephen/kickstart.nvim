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
        focus = 'list',
        auto_close = true,
        jump = { close = true },
        layout = 'default',
        win = {
          input = {
            keys = {
              ['<c-l>'] = { 'focus_preview', mode = { 'n', 'i' } },
            },
          },
          list = {
            keys = {
              ['<c-l>'] = 'focus_preview',
            },
          },
          preview = {
            keys = {
              ['<c-l>'] = 'focus_list',
            },
          },
        },
        -- layout = {
        --   preview = 'main', -- Instantly shows the preview panel by default!
        --   preset = 'sidebar', -- Keeps it docked as a sidebar
        -- },
      },
    },
  },
}

-- Open the floating Snacks Explorer
vim.keymap.set('n', '<leader>e', function() require('snacks').explorer() end, { desc = 'Toggle Floating Explorer' })

-- 2. Open Lazygit in a gorgeous floating terminal frame
vim.keymap.set('n', '<leader>gg', function() require('snacks').lazygit.open() end, { desc = 'Open Lazygit Overlay' })

-- ====================================================================
-- SNACKS EXPLORER PREVIEW CHEAT SHEET
-- ====================================================================
-- P ..... Show or hide the preview pane.
-- <C-l> . Move focus between the file list/search box and the preview pane.
--         It also opens the preview pane if it is hidden.
-- i ..... From the preview pane, return focus to the search input.
