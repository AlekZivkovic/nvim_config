local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
      -- theme = 'codedark'
    },
     sections = {
       lualine_a = {'mode'},
       lualine_b = { "branch" },
       lualine_c = { "diagnostics" },
       lualine_x = { "system", "filetype" },
       lualine_y = { "progress" },
       lualine_z = {},
     },
     extensions = { "quickfix", "man", "fugitive" },
    -- icons_enabled = true,
     --theme = 'codedark',
  }
end

return M
