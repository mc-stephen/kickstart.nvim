vim.pack.add { 'https://github.com/windwp/nvim-ts-autotag' }

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,          -- Auto close tags like <div> -> </div>
    enable_close_on_slash = true, -- Auto close on trailing </
    enable_rename = true,         -- Rename opening tag -> renames closing tag
  }
})
