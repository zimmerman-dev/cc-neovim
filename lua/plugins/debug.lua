-- ~/.config/nvim/lua/plugins/debug.lua  (or your cc-neovim path)
return {
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" }, -- lazy-load for C/C++
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap   = require("dap")
      local dapui = require("dapui")

      -------------------------------------------------------------------
      -- UI
      -------------------------------------------------------------------
      dapui.setup()

      -------------------------------------------------------------------
      -- Adapter: GDB (C/C++)
      -------------------------------------------------------------------
      dap.adapters.cpp = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }

      -------------------------------------------------------------------
      -- Paths (resolved once per session)
      -------------------------------------------------------------------
      local WS        = vim.fn.getcwd()                  -- project root (open nvim from here!)
      local SRC_DIR   = WS .. "/src"
      local BUILD_DIR = WS .. "/build"

      -------------------------------------------------------------------
      -- Choose CMake binary or single-file fallback (portable)
      -------------------------------------------------------------------
      local LAST_EXE = nil
      local function pick_executable()
        local proj = vim.fn.fnamemodify(WS, ":t")
        local cmake_bin = BUILD_DIR .. "/" .. proj
        local fallback  = WS .. "/bin/debug.out"

        if vim.fn.filereadable(cmake_bin) == 1 then
          LAST_EXE = cmake_bin
          print("[DAP] Using CMake binary: " .. cmake_bin)
          return cmake_bin
        end

        vim.fn.mkdir(WS .. "/bin", "p")
        local file = vim.fn.expand("%:p")
        local cmd  = string.format("g++ -g -O0 %s -o %s", file, fallback)
        print("[DAP] Compiling single file: " .. cmd)
        os.execute(cmd)
        LAST_EXE = fallback
        return fallback
      end

      -------------------------------------------------------------------
      -- Send a raw GDB CLI command via DAP (works with gdb-mi)
      -------------------------------------------------------------------
      local function gdb_cli(cmd)
        local s = dap.session()
        if not s then return end
        s:request("evaluate", { expression = "-exec " .. cmd, context = "repl" }, function() end)
      end

      -------------------------------------------------------------------
      -- C/C++ configuration
      -------------------------------------------------------------------
      local cpp_config = {
        {
          name = "Debug (CMake or Single File)",
          type = "cpp",
          request = "launch",
          program = pick_executable,
          cwd = WS,
          stopOnEntry = true, -- flip to false once you’re happy
          -- Keep MI setup minimal; we inject path fixes via listeners below
          setupCommands = {
            { text = "-enable-pretty-printing", ignoreFailures = true },
          },
        },
      }
      dap.configurations.cpp = cpp_config
      dap.configurations.c   = cpp_config

      -------------------------------------------------------------------
      -- Bootstrap GDB paths BEFORE breakpoints resolve (project-agnostic)
      -------------------------------------------------------------------
      dap.listeners.before.event_initialized["dap_paths_bootstrap"] = function()
        -- 1) Accept pending breakpoints during startup
        gdb_cli("set breakpoint pending on")
        -- 2) Add project root as a source directory
        gdb_cli("directory " .. WS)
        -- 3) If a src/ directory exists, add it explicitly
        if vim.fn.isdirectory(SRC_DIR) == 1 then
          gdb_cli("directory " .. SRC_DIR)
        end
        -- 4) Map build/ paths back to the project root (DWARF → source)
        if vim.fn.isdirectory(BUILD_DIR) == 1 then
          gdb_cli("set substitute-path " .. BUILD_DIR .. " " .. WS)
        end
      end

      -- Open UI after init; close on exit (comment the closes if you want UI to persist)
      dap.listeners.after.event_initialized["dapui_open"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_close"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_close"]      = function() dapui.close() end

      -------------------------------------------------------------------
      -- Helper command
      -------------------------------------------------------------------
      vim.api.nvim_create_user_command("DAPInfo", function()
        print("[DAP] WS=" .. WS)
        print("[DAP] SRC_DIR=" .. SRC_DIR .. (vim.fn.isdirectory(SRC_DIR) == 1 and " (exists)" or " (missing)"))
        print("[DAP] BUILD_DIR=" .. BUILD_DIR .. (vim.fn.isdirectory(BUILD_DIR) == 1 and " (exists)" or " (missing)"))
        if LAST_EXE then print("[DAP] LAST_EXE=" .. LAST_EXE) end
      end, {})
    end,
  },
}

