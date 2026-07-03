-- Set your leader key just in case it isn't global yet
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ====================================================================
-- WINDOW MANAGEMENT (<leader>w)
-- ====================================================================
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Window: Split Vertically' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Window: Split Horizontally' })
vim.keymap.set('n', '<leader>wd', '<C-w>c', { desc = 'Window: Close Current Split' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Window: Close All Other Splits' })

-- Reset all windows to equal balance
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Window: Make Equal Size' })

-- Method B: The Arrow Key Backup Way (Mac-safe sequence)
-- vim.keymap.set('n', '<leader>w<Up>',    ':resize +2<CR>',          { desc = 'Window: Resize Up (Arrow)' })
-- vim.keymap.set('n', '<leader>w<Down>',  ':resize -2<CR>',          { desc = 'Window: Resize Down (Arrow)' })
-- vim.keymap.set('n', '<leader>w<Left>',  ':vertical resize -2<CR>', { desc = 'Window: Resize Left (Arrow)' })
-- vim.keymap.set('n', '<leader>w<Right>', ':vertical resize +2<CR>', { desc = 'Window: Resize Right (Arrow)' })

-- KITTY & MAC-SAFE FLUID RESIZING (Hold Alt/Option + Arrow Keys)
vim.keymap.set('n', '<M-Up>',    ':resize +4<CR>',          { desc = 'Window: Continuous Resize Up' })
vim.keymap.set('n', '<M-Down>',  ':resize -4<CR>',          { desc = 'Window: Continuous Resize Down' })
vim.keymap.set('n', '<M-Left>',  ':vertical resize -4<CR>', { desc = 'Window: Continuous Resize Left' })
vim.keymap.set('n', '<M-Right>', ':vertical resize +4<CR>', { desc = 'Window: Continuous Resize Right' })

-- Quick window navigation (Hold Ctrl + vim keys to jump splits instantly)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- ====================================================================
-- BUFFER MANAGEMENT (<leader>b)
-- ====================================================================
vim.keymap.set('n', '<leader>bb', function() require('snacks').picker.buffers() end, { desc = 'Buffer: Pick Open File' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Buffer: Close Current File' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>',   { desc = 'Buffer: Next Tab' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>',   { desc = 'Buffer: Previous Tab' })

-- ====================================================================
-- CODE INTEL / LSP (<leader>c)
-- ====================================================================
vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Code: Format Buffer' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code: Available Actions' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename,      { desc = 'Code: Rename Smart Variable' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Code: Line Diagnostics/Errors' })

-- ====================================================================
-- Terminal
-- ====================================================================
vim.keymap.set("n", "<leader>tt", function() Snacks.terminal.toggle() end, { desc = "Terminal: Toggle Float" })
vim.keymap.set("n", "<leader>ts", function() Snacks.terminal.open(nil, { win = { position = "bottom" } }) end, { desc = "Terminal: Open Horizontal Split" })

-- This lets you toggle the floating terminal from Normal mode AND inside the terminal itself!
vim.keymap.set({ "n", "t" }, "<C-/>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })

-- ====================================================================
-- EASILY MOVE LINES OF CODE BLOCKS
-- ====================================================================
-- Move lines up and down in Normal mode
vim.keymap.set('n', '<C-S-Down>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-S-Up>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })

-- Move lines up and down in Insert mode
vim.keymap.set('i', '<C-S-Down>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<C-S-Up>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })

-- Move selected blocks up and down in Visual mode
vim.keymap.set('v', '<C-S-Down>', ":m '>+1<cr>gv=gv", { desc = 'Move block down' })
vim.keymap.set('v', '<C-S-Up>', ":m '<-2<cr>gv=gv", { desc = 'Move block up' })

-- ====================================================================
-- DYNAMIC LSP KEYMAPS (Activates only when a Code Engine is running)
-- ====================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    -- Helper function to quickly define LSP-specific mappings
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- The "Go To" family under 'g'
    -- map('gd', function() require('snacks').picker.lsp_definitions() end, '[G]oto [D]efinition')
    -- map('gr', function() require('snacks').picker.lsp_references() end, '[G]oto [R]eferences')
    -- map('gI', function() require('snacks').picker.lsp_implementations() end, '[G]oto [I]mplementation')
    -- map('gy', function() require('snacks').picker.lsp_type_definitions() end, 'Type [D]efinition')
    -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Documentation Hover (Show function signatures/docs)
    -- map('K', vim.lsp.buf.hover, 'Hover Documentation')
  end,
})
