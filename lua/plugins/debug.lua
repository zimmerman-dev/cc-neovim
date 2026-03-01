-- lua/plugins/debug.lua
return {
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          ensure_installed = { "codelldb" },
          automatic_installation = true,
        },
      },
    },
    config = function()
      local dap   = require("dap")
      local dapui = require("dapui")

      -------------------------------------------------------------------
      -- UI
      -------------------------------------------------------------------
      dapui.setup()

      -------------------------------------------------------------------
      -- Adapter: codelldb (LLDB-based, proper DAP)
      -------------------------------------------------------------------
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

      dap.adapters.codelldb = {
        type    = "server",
        port    = "${port}",
        executable = {
          command = codelldb_path,
          args    = { "--port", "${port}" },
        },
      }

      -------------------------------------------------------------------
      -- C / C++ configuration (dynamic workspace at session start)
      -------------------------------------------------------------------
      local function make_config()
        return {
          {
            name    = "Debug (CMake or Single File)",
            type    = "codelldb",
            request = "launch",
            program = function()
              local ws        = vim.fn.getcwd()
              local proj      = vim.fn.fnamemodify(ws, ":t")
              local cmake_bin = ws .. "/build/" .. proj

              if vim.fn.filereadable(cmake_bin) == 1 then
                vim.notify("[DAP] Using CMake binary: " .. cmake_bin, vim.log.levels.INFO)
                return cmake_bin
              end

              local fallback = ws .. "/bin/debug.out"
              vim.fn.mkdir(ws .. "/bin", "p")
              local file = vim.fn.expand("%:p")
              local cmd  = string.format("g++ -g -O0 %s -o %s 2>&1", file, fallback)
              vim.notify("[DAP] Compiling: " .. cmd, vim.log.levels.INFO)
              local result = vim.fn.system(cmd)
              if vim.v.shell_error ~= 0 then
                vim.notify("[DAP] Compilation failed:\n" .. result, vim.log.levels.ERROR)
                return nil
              end
              return fallback
            end,
            cwd          = "${workspaceFolder}",
            stopOnEntry  = false,
          },
        }
      end

      dap.configurations.cpp = make_config()
      dap.configurations.c   = make_config()

      -------------------------------------------------------------------
      -- Auto open/close UI
      -------------------------------------------------------------------
      dap.listeners.after.event_initialized["dapui_open"]   = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_close"]  = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_close"]      = function() dapui.close() end

      -------------------------------------------------------------------
      -- Helper command
      -------------------------------------------------------------------
      vim.api.nvim_create_user_command("DAPInfo", function()
        local ws = vim.fn.getcwd()
        print("[DAP] WS=" .. ws)
        print("[DAP] build/ " .. (vim.fn.isdirectory(ws .. "/build") == 1 and "exists" or "missing"))
        print("[DAP] src/ "   .. (vim.fn.isdirectory(ws .. "/src")   == 1 and "exists" or "missing"))
      end, {})
    end,
  },
}
