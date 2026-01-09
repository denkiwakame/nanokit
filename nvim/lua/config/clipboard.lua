vim.opt.clipboard:append({ 'unnamedplus' })

vim.keymap.set({ 'n', 'v' }, 'cp', '"+p', { desc = 'paste from clipboard' })
vim.keymap.set({ 'n', 'v' }, 'cy', '"+y', { desc = 'yank to clipboard' })

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ['+'] = 'xsel -bi',
      ['*'] = 'xsel -bi',
    },
    paste = {
      ['+'] = 'xsel -bo',
      ['*'] = function() return vim.fn.systemlist('xsel -bo | tr -d "\r"') end,
    },
    cache_enabled = 1
  }
end
