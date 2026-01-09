return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    init = function()
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-yaml',
        'coc-toml',
        'coc-prettier',
        'coc-pyright',
        'coc-rust-analyzer',
        'coc-lua'
      }
    end,
    config = function()
      -- Basic CoC settings
      vim.opt.backup = false
      vim.opt.writebackup = false
      vim.opt.updatetime = 300
      vim.opt.signcolumn = 'yes'

      -- Completion keymaps
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
      vim.keymap.set('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<S-TAB>"', opts)
      vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', opts)

      -- Navigation
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
      vim.keymap.set('n', 'K', '<CMD>call CocActionAsync("doHover")<CR>', { silent = true })
      
      -- Diagnostics
      vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
      vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
      
      -- Format command
      vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})
    end
  }
}
