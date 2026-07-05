-- 1. Install and load todo-comments.nvim via the native package manager
vim.pack.add({ 'https://github.com/folke/todo-comments.nvim' })

-- 2. Run the core setup (equivalent to opts = {})
require('todo-comments').setup({})

-- 3. Bind the shortcuts natively using vim.keymap.set

-- Jump to next/previous TODO comments within the active file
vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next Todo Comment' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous Todo Comment' })

-- Trouble Panels (Lists todos in a bottom diagnostics window)
vim.keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle<cr>', { desc = 'Todo List (Trouble)' })
vim.keymap.set('n', '<leader>xT', '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>', { desc = 'Critical Todos (Trouble)' })

-- Telescope Search (Fuzzy-finds todos project-wide interactively)
vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Search Todos (Telescope)' })
vim.keymap.set('n', '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', { desc = 'Search Critical Todos (Telescope)' })


--[[
===============================================================================
📝 TODO-COMMENTS.NVIM CHEAT SHEET & KEYWORDS 📝
===============================================================================
This plugin automatically highlights and extracts comments starting with specific
keywords, transforming plain text markers into colorful, searchable focal points.

-------------------------------------------------------------------------------
SUPPORTED KEYWORDS (Type these out in your comments):
-------------------------------------------------------------------------------
    * TODO:  Normal tasks or reminders.
    * FIX:   Bugs, broken logic, or things needing repair (Aliases: FIXME, BUG).
    * WARN:  Warnings, hazards, or sketchy code blocks (Alias: WARNING).
    * NOTE:  Contextual explanations or pointers (Alias: INFO).
    * PERF:  Performance bottlenecks or optimization ideas (Alias: OPTIMIZE).
    * HACK:  Temporary duct-tape fixes or code smells.

-------------------------------------------------------------------------------
1. FILE-LEVEL NAVIGATION (']t' and '[t')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Instantly cycles your cursor forward or backward between any marked comment 
    blocks inside your current file.

--> PRACTICAL EXAMPLE:
    You open a file with 5 different TODOs scattered across 600 lines. 
    Spamming ']t' will teleport your cursor directly to the next comment block, 
    completely skipping the raw source code in between.

-------------------------------------------------------------------------------
2. TELESCOPE FUZZY SEARCH ('Space + s + t' / 'Space + s + T')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Uses Telescope to pull a live, fuzzy-searchable interface of EVERY target 
    comment keyword written across your whole project workspace.

--> PRACTICAL EXAMPLES:
    * Global List ('<leader>st'): Opens a layout showing every single NOTE, 
      HACK, and TODO in your project. Type a word to search through them live.
      
    * Critical Focus ('<leader>sT'): Dynamically filters the list to hide 
      soft markers like NOTES—leaving only code-breaking issues (TODO, FIX, FIXME).

-------------------------------------------------------------------------------
3. TROUBLE DIAGNOSTICS VIEW ('Space + x + t' / 'Space + x + T')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Groups your workspace tasks directly inside a clean, fixed split-pane window 
    at the bottom of your viewport. Perfect for checking off remaining development 
    milestones before making a Git commit.
===============================================================================
]]
