local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules" 
    }
  }
}
