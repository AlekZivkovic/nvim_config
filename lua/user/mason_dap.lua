local M = {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
}

function M.config()
    local dap = require('mason-nvim-dap')
    dap.setup({
        handlers = {},
    })
end

return M
