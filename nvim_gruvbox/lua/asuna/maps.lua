local keymap = vim.keymap

vim.g.mapleader = ";"

keymap.set("n","<leader>q",vim.cmd.Ex)


-- Working with tabs
keymap.set('n', 'mc', ':tabnew<Return>')
keymap.set('n', 'mk', ':tabclose<Return>')
keymap.set('n', 'mn', ':+tabnext<Return>')
keymap.set('n', 'ml', ':-tabnext<Return>')
keymap.set('n', 'ma', ':1tabnext<Return>')
keymap.set('n', 'mtn', ':+tabmove<Return>')
keymap.set('n', 'mtl', ':-tabmove<Return>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Quit
keymap.set('n', 'sc', ':q<Return>')
keymap.set('n', 'sq', ':q!<Return>')

-- Save
keymap.set('n', 'sw', ':w!<Return>')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')


-- Resize window
keymap.set("n", "<C-l>", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
keymap.set("n", "<C-h>", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
keymap.set("n", "<C-k>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
keymap.set("n", "<C-j>", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Map the key combination to trigger the command
vim.api.nvim_set_keymap('x', 'rs', ':<C-U>\'<,\'>s/\\%V', { silent = true, noremap = true })


