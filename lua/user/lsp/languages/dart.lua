-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })

local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

flutter_tools.setup {
  lsp = {
    color = {
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    settings = {
      lineLength = 120,
    },
    on_attach = function(client, bufnr)
      require("lvim.lsp").common_on_attach(client, bufnr)
    end,
    capabilities = require("lvim.lsp").capabilities,
  },
  debugger = {
    enabled = true,
    runregister_configurations = function(_)
      require("lvim.core.dap").configurations.dart = {
        type = "dart",
        request = "launch",
        name = "Launch flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
        args = { "-d", "linux" },
      }
      require("dap.ext.vscode").load_launchjs()
    end,
    exception_breakpoints = {},
    run_via_dap = true,
  },
  widget_guides = {
    enabled = true,
    debug = true,
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },
  settings = {
    showTodos = true,
    renameFilesWithClasses = "prompt",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = false,
    },
  },
}
