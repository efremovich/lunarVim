local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
}

vim.filetype.add {
  extension = {
    sh = "sh",
    zsh = "zsh",
  },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("bashls", {
  filetypes = { "sh", "zsh" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

local M = {}
local dap_utils = require "user.plugins.configs.dap.utils"
local BASH_DEBUG_ADAPTER_BIN = dap_utils.MASON_BIN_PATH .. "/bash-debug-adapter"
local BASHDB_DIR = dap_utils.MASON_PACKAGE_PATH .. "/bash-debug-adapter/extension/bashdb_dir"
function M.setup()
  local dap = require "dap"
  dap.adapters.sh = {
    type = "executable",
    command = BASH_DEBUG_ADAPTER_BIN,
  }
  dap.configurations.sh = {
    {
      name = "Launch Bash debugger",
      type = "sh",
      request = "launch",
      program = "${file}",
      cwd = "${fileDirname}",
      pathBashdb = BASHDB_DIR .. "/bashdb",
      pathBashdbLib = BASHDB_DIR,
      pathBash = "bash",
      pathCat = "cat",
      pathMkfifo = "mkfifo",
      pathPkill = "pkill",
      env = {},
      args = {},
      -- showDebugOutput = true,
      -- trace = true,
    }
  }
end

return M
