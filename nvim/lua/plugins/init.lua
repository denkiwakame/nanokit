return {
  -- Colorscheme
  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_contrast_dark = 'medium'
      vim.cmd('colorscheme gruvbox')
    end
  },
  
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      }
    end
  },
  
  -- File finder
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      local actions = require("telescope.actions")
      
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })

      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    end
  },
  
  -- Git integration
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<Space>gs', ':Git status<CR>', { desc = 'Git status' })
      vim.keymap.set('n', '<Space>ga', ':Git add<CR>', { desc = 'Git add' })
      vim.keymap.set('n', '<Space>gc', ':Git commit -v<CR>', { desc = 'Git commit' })
      vim.keymap.set('n', '<Space>gd', ':Gvdiffsplit<CR>', { desc = 'Git diff' })
    end
  },
}