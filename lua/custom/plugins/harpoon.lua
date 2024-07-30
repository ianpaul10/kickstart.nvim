-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>as',
      function()
        require('harpoon'):list():append()
      end,
      desc = 'h[A]rpoon [S]ave file',
    },
    {
      '<leader>aa',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'h[A]rpoon quick menu [A]',
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'harpoon to file 1',
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'harpoon to file 2',
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'harpoon to file 3',
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'harpoon to file 4',
    },
    {
      '<leader>5',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'harpoon to file 5',
    },
    {
      '<leader>an',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'h[A]rpoon [N]ext file',
    },
    {
      '<leader>ap',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'h[A]rpoon [P]revious file',
    },
  },
}
