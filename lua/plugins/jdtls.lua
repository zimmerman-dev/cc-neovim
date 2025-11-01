---@diagnostic disable: undefined-global
return {
  "mfussenegger/nvim-jdtls",
  ft = "java", -- Load only for Java files
  config = function()
    local jdtls = require("jdtls")

    local home = os.getenv("HOME")
    local jdtls_install = home .. "/.local/share/jdtls"
    local jdtls_config = jdtls_install .. "/config_linux"
    local jdtls_launcher = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local workspace_dir = home .. "/.cache/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

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

