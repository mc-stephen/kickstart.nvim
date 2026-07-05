-- 1. Install and load flash.nvim via the native package manager
vim.pack.add({ 'https://github.com/folke/flash.nvim' })

-- 2. Run the core setup (equivalent to opts = {})
require('flash').setup({})

-- 3. Bind the shortcuts natively using vim.keymap.set

-- Standard teleport jump (Normal, Visual, and Operator-pending modes)
vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Flash: Teleport Jump' })

-- Treesitter structural node jump
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
  require('flash').treesitter()
end, { desc = 'Flash: Treesitter Jump' })

-- Remote action (run an operation on text elsewhere without moving cursor)
vim.keymap.set('o', 'r', function()
  require('flash').remote()
end, { desc = 'Flash: Remote Operation' })

-- Treesitter search pattern execution
vim.keymap.set({ 'o', 'x' }, 'R', function()
  require('flash').treesitter_search()
end, { desc = 'Flash: Treesitter Search' })

-- Toggle Flash overlays mid-search (Command line mode only)
vim.keymap.set('c', '<c-s>', function()
  require('flash').toggle()
end, { desc = 'Flash: Toggle overlay during native search' })

-- Smart Incremental Selection (Ctrl + Space to expand, Backspace to shrink)
vim.keymap.set({ 'n', 'x', 'o' }, '<c-space>', function()
  require('flash').treesitter({
    actions = {
      ['<c-space>'] = 'next',
      ['<BS>'] = 'prev',
    },
  })
end, { desc = 'Flash: Treesitter Incremental Selection' })


--[[
===============================================================================
⚡ FLASH.NVIM CHEAT SHEET & PRACTICAL EXAMPLES ⚡
===============================================================================
This plugin is a visual teleporter. Instead of spamming motion keys (h/j/k/l/w/b),
you target text visually using glowing label overlays.

-------------------------------------------------------------------------------
1. NATIVE TELEPORT JUMP ('s')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Instantly jumps your cursor to any word visible on your screen. Works in 
    Normal mode (to move), Visual mode (to select), and Operator mode (to delete/yank).

--> HOW TO USE IT:
    1. Press 's'
    2. Type the first 2 letters of the word you want to go to.
    3. Flash will highlight all matches and put a unique letter (e.g., 'A', 'K') over them.
    4. Press that letter, and your cursor instantly teleports there.

--> PRACTICAL EXAMPLES:
    * Navigation: You are on line 1, you see the word "config" on line 45.
      Press 's' -> Type 'co' -> See a red 'G' over "config" -> Press 'G'. You are there.
      
    * Visual Selection: You want to highlight text from your cursor to a word down the screen.
      Press 'v' (visual mode) -> Press 's' -> Type the target word -> Select the label.

-------------------------------------------------------------------------------
2. TREESITTER CODE-BLOCK JUMP ('S')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Instead of targeting letters, this uses Neovim's code-parser (Treesitter) 
    to target entire structures like functions, loops, arrays, or conditional blocks.

--> HOW TO USE IT:
    1. Press 'S' (Shift + s)
    2. Flash will highlight and place labels over entire blocks of code.
    3. Press the label to instantly highlight/select that entire code block.

--> PRACTICAL EXAMPLE:
    * You want to quickly highlight or look at a massive multi-line `if/else` statement.
      Press 'S' -> Labels appear over the scopes -> Press the label over the `if` block.

-------------------------------------------------------------------------------
3. REMOTE OPERATIONS ('r') -- The Ultimate Power Feature
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Allows you to delete, copy, or change text somewhere else on the screen 
    WITHOUT moving your cursor away from where you are currently typing.

--> HOW TO USE IT:
    1. Start a normal Vim action (like 'd' for delete, 'y' for yank/copy).
    2. Press 'r' (Remote Flash).
    3. Use Flash labels to pick a word or code block somewhere else on your screen.
    4. The action happens instantly over there, and your cursor stays exactly where it was.

--> PRACTICAL EXAMPLE:
    * You are writing code on line 5, but you realize you want to delete a word on line 25.
      Type: 'd' -> 'r' -> (Flash activates) type the letters of the word on line 25 -> select label.
      Result: Word on line 25 vanishes. Your cursor never left line 5!

-------------------------------------------------------------------------------
4. SMART INCREMENTAL SELECTION ('Ctrl + Space' & 'Backspace')
-------------------------------------------------------------------------------
--> WHAT IT DOES:
    Intelligently expands or shrinks your text selection based on the structure 
    of the code (similar to VS Code's smart selection expansion).

--> HOW TO USE IT:
    * Press 'Ctrl + Space' once -> Selects the word your cursor is on.
    * Press 'Ctrl + Space' again -> Expands selection to the whole line/sentence.
    * Press 'Ctrl + Space' again -> Expands selection to the containing block/function.
    * Press 'Backspace' -> Shrinks the selection back down by one level if you went too far.

===============================================================================
]]
