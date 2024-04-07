local M = {
  --"rebelot/kanagawa.nvim",
 "LunarVim/darkplus.nvim",
--y- "askfiy/visual_studio_code",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugin s
}

function M.config()
  vim.cmd.colorscheme "darkplus"
  vim.cmd "highlight TelescopeBorder guibg=none"
  vim.cmd "highlight TelescopeTitle guibg=none"
  vim.cmd "highlight DiagnosticSignWarn guibg=none"
  vim.cmd "highlight DiagnosticSignError guibg=none"
  vim.cmd "highlight TelescopeSelection guibg=#2a2a37"
  vim.cmd "highlight TelescopeSelectionCaret guibg=#2a2a37"
  vim.cmd "highlight WinBar guibg=none"
  vim.cmd "highlight MsgArea guibg=none"
  vim.cmd "highlight ModeMsg guibg=none"
end

return M
