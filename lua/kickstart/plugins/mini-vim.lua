local header_art_1 = [[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

local header_art_2 = [[
 /\\\\\_____/\\\_______________________________/\\\________/\\\___________________________
 \/\\\\\\___\/\\\______________________________\/\\\_______\/\\\___________________________
 _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________
  _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\___
   _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_
    _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\_
     _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_
      _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\_
       _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__
]]

return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- require('mini.tabline').setup()
    require('mini.icons').setup()

    require('mini.sessions').setup { autoread = false, autowrite = true, directory = '~/.neovim_sessions' }
    local write_as_cwd = function()
      local session_name = vim.fn.getcwd():gsub('/Users/ianpaul/', ''):gsub('/', '_'):gsub('%.', '')
      MiniSessions.write(session_name)
    end
    vim.keymap.set('n', '<Leader>ww', write_as_cwd, { desc = '[W]rite [W]orkspace to a session' })

    require('mini.starter').setup { header = header_art_2, footer = '' }
    require('mini.pairs').setup()
    require('mini.jump').setup()

    require('mini.files').setup()
    local minifiles_toggle = function(...)
      if not MiniFiles.close() then
        MiniFiles.open(...)
      end
    end
    local open_file_explorer = function()
      local path = vim.fn.getcwd()
      local use_latest = true
      local opts = {}
      MiniFiles.reset()
      MiniFiles.open(path, use_latest, opts)
    end
    vim.keymap.set('n', '-', minifiles_toggle, { desc = 'Open mini file explorer' })

    -- require('mini.notify').setup()
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
