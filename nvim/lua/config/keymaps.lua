-- US keyboard Setting
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- comment line
vim.keymap.set('v', '-', function()
  vim.cmd('normal gc')
end, { noremap = true, desc = 'comment out selected lines' })

-- insert mode brackets completion
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '"', '""<left>')
vim.keymap.set('i', "'", "''<left>")

-- window navigation
vim.keymap.set('n', 'ss', '<C-w>w')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
