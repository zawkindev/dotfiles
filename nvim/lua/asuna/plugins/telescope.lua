return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config=function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', ';f', builtin.find_files, {})
	vim.keymap.set('n', ';r', builtin.live_grep, {})
      end
}


