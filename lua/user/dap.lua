local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "williamboman/mason.nvim",
  "nvim-neotest/nvim-nio",
  },
}

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text_status = require("nvim-dap-virtual-text")


    local wk = require "which-key"
    wk.register {
        ["<leader>dt"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
        ["<leader>dc"] = { "<cmd>DapContinue<cr>", "Start Debugger" },
    }


    dap_virtual_text_status.setup({
      enabled = true,                        -- enable this plugin (the default)
      enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true,               -- show stop reason when stopped for exceptions
      commented = true,                      -- prefix virtual text with comment string
      only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
      all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
      filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
      -- experimental features:
      virt_text_pos = "eol",                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
      all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    })
    
    dapui.setup()

--[[ 
    dapui.setup({
      layouts = {
        {
          elements = {
            "watches",
          },
          size = 0.2,
          position = "left",
        },
      },
      controls = {
        enabled = false,
      },
      render = {
        max_value_lines = 3,
      },
      floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    })
 ]]

    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            command = 'C:\\Users\\pcziv\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\codelldb',
            args = {"--port", "${port}"},
        }
    }

    dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Launch with Arguments',
        type = 'codelldb',
        request = 'launch',
        args = function ()
            local args_string =  vim.fn.input("Input arguments: ")
            return vim.split(args_string, " ")
        end,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    } 
    
    local icons  = require("user.icons")
    vim.cmd('highlight DarBreakpoint guifg=#FF8888')
    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Circle, texthl = "DarBreakpoint", linehl = "", numhl = "DarBreakpoint" })

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', "<leader>dc", dap.continue, {})
    
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    
    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
        -- dap.defaults.fallback.terminal_win_cmd = "10split new"
    end
return M

