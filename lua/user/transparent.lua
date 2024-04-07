local M = {
  "xiyaowong/transparent.nvim",
  lazy = false
}

function M.config()
  require("transparent").setup({ -- Optional, you don't have to run setup.
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },
    extra_groups = {'NvimTreeNormal'}, -- table: additional groups that should be cleared
    exclude_groups = {'TelescopeSelection'}, -- table: groups you don't want to clear
  })
  require('transparent').clear_prefix('gitsigns')

 -- require('transparent').clear_prefix('TabLine')
  --require('transparent').clear_prefix('Cmdline')
end

return M
