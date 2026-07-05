-- 1. Fetch, install, and load the plugin via the native package manager
vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

-- 2. Configure the plugin directly (this replaces the 'opts' block)
require('grug-far').setup({
  headerMaxWidth = 80,
})

-- 3. Bind the smart keymap natively (this replaces the 'keys' and 'mode' blocks)
vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
  local grug = require('grug-far')
  -- Grab the file extension of your current file if it exists
  local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')

  grug.open({
    transient = true,
    prefills = {
      -- Apply the auto-filter based on the file extension
      filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
    },
  })
end, { desc = 'Search and Replace' })
