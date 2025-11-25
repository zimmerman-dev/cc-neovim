---@diagnostic disable: undefined-global
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",

  config = function()
    local jdtls = require("jdtls")
    local home = os.getenv("HOME")

    -- Mason install location
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local mason_launcher = mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"
    local mason_config = mason_path .. "/config_linux"

    -- Legacy/manual install location (your Fedora box)
    local legacy_path = home .. "/.local/share/jdtls"
    local legacy_launcher = legacy_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"
    local legacy_config = legacy_path .. "/config_linux"

    -- Automatically select whichever installation exists
    local jdtls_launcher
    local jdtls_config

    if vim.fn.glob(mason_launcher) ~= "" then
      jdtls_launcher = vim.fn.glob(mason_launcher)
      jdtls_config = mason_config
    elseif vim.fn.glob(legacy_launcher) ~= "" then
      jdtls_launcher = vim.fn.glob(legacy_launcher)
      jdtls_config = legacy_config
    else
      vim.notify("JDTLS not found: install via Mason or place in ~/.local/share/jdtls", vim.log.levels.ERROR)
      return
    end

    local workspace_dir = home .. "/.cache/jdtls-workspace/" ..
      vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", jdtls_launcher,
        "-configuration", jdtls_config,
        "-data", workspace_dir,
      },

      root_dir = require("jdtls.setup").find_root({
        ".git", "mvnw", "gradlew", "pom.xml", "build.gradle",
      }) or vim.fn.getcwd(),
    }

    jdtls.start_or_attach(config)
  end
}

