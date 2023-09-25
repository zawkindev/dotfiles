local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dW', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Working with tabs
keymap.set('n', 'mc', ':tabnew<Return>')
keymap.set('n', 'mk', ':tabclose<Return>')
keymap.set('n', 'mn', ':+tabnext<Return>')
keymap.set('n', 'ml', ':-tabnext<Return>')
keymap.set('n', 'ma', ':1tabnext<Return>')
keymap.set('n', 'm;', ':$tabnext<Return>')
keymap.set('n', 'mtn', ':+tabmove<Return>')
keymap.set('n', 'mtl', ':-tabmove<Return>')
keymap.set('n', 'mta', ':0tabmove<Return>')
keymap.set('n', 'mt;', ':$tabmove<Return>')

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
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')