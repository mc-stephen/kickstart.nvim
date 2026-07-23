vim.pack.add {
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}

-- In-Buffer Native Rendering (Modern & Minimal)
require('render-markdown').setup({})

vim.keymap.set('n', '<leader>ut', ':RenderMarkdown toggle<CR>', { desc = 'Markdown: Toggle In-Buffer Render' })
