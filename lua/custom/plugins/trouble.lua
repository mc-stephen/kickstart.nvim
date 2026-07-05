-- 1. Install and load trouble.nvim via the native package manager
vim.pack.add({ 'https://github.com/folke/trouble.nvim' })

-- 2. Configure Trouble (moves the LSP view to a vertical panel on the right side)
require('trouble').setup({
  modes = {
    lsp = {
      win = { position = 'right' },
    },
  },
})

-- 3. Bind the shortcuts natively
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble Workspace)' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Diagnostics (Trouble Current File)' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle<cr>', { desc = 'Symbols Outline (Trouble)' })
vim.keymap.set('n', '<leader>cS', '<cmd>Trouble lsp toggle<cr>', { desc = 'LSP Ref/Def List (Trouble)' })
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- Smart Navigation: Jump to previous issue or reference
vim.keymap.set('n', '[q', function()
  if require('trouble').is_open() then
    require('trouble').prev({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then vim.notify(err, vim.log.levels.ERROR) end
  end
end, { desc = 'Previous Trouble/Quickfix Item' })

-- Smart Navigation: Jump to next issue or reference
vim.keymap.set('n', ']q', function()
  if require('trouble').is_open() then
    require('trouble').next({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then vim.notify(err, vim.log.levels.ERROR) end
  end
end, { desc = 'Next Trouble/Quickfix Item' })


--[[
===============================================================================
🕵️ TROUBLE.NVIM CHEAT SHEET & PRACTICAL EXAMPLES 🕵️
===============================================================================
This plugin aggregates errors, warnings, and code references into a highly 
navigable, interactive split-pane instead of cluttering your working screen.

-------------------------------------------------------------------------------
1. WORKSPACE DIAGNOSTICS ('Space + x + x')
-------------------------------------------------------------------------------
--> WHAT IT DOES: 
    Opens a bottom window showing EVERY error and warning across your whole project.
    
--> PRACTICAL EXAMPLE:
    You change a function signature in one file, breaking code in three other 
    unopened files. Press '<leader>xx' to see a list of every broken line project-wide.
    Press 'Enter' on an entry to jump directly to that file and fix it.

-------------------------------------------------------------------------------
2. CURRENT BUFFER DIAGNOSTICS ('Space + x + X')
-------------------------------------------------------------------------------
--> WHAT IT DOES: 
    Identical to the workspace view, but strictly filters the list to show issues
    inside the single file you are actively working on right now (`filter.buf=0`).

-------------------------------------------------------------------------------
3. CODE SYMBOLS OUTLINE ('Space + c + s')
-------------------------------------------------------------------------------
--> WHAT IT DOES: 
    Opens an interactive structural tree sidebar of your current file. It lists 
    every Class, Method, Variable, and Function in order.
    
--> PRACTICAL EXAMPLE:
    You open a massive 2,000-line file. Press '<leader>cs' to see an organized 
    sidebar outline. Use 'j'/'k' to scroll the outline, press 'Enter' to instantly
    teleport your main cursor straight to that function definition.

-------------------------------------------------------------------------------
4. GLOBAL LSP REFERENCES ('Space + c + S')
-------------------------------------------------------------------------------
--> WHAT IT DOES: 
    Pops out a vertical pane on the right side of the screen displaying every 
    single place a specific function or variable is being used in the code base.

--> PRACTICAL EXAMPLE:
    Hover your cursor over a function name and press '<leader>cS'. The right 
    panel opens showing all files referencing that function. Arrow down through the 
    list to see a sneak-peek preview snippet of how it is used in those files!

-------------------------------------------------------------------------------
5. SMART JUMPING PROTOCOL ('[q' and ']q')
-------------------------------------------------------------------------------
--> WHAT IT DOES: 
    Universal shortcuts to cycle through issue/reference lists.
    
--> PRACTICAL EXAMPLE:
    If your Trouble diagnostics window is open, typing ']q' teleports your cursor 
    instantly to the next compiler error in the list. If the Trouble panel is closed, 
    it falls back natively to stepping through standard Vim quickfix registers (`:cnext`).
===============================================================================
]]
