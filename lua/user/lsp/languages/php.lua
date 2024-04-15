-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "phpcs", filetypes = { "php" } },

-- }
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("phpactor", {
--   filetypes = { "php" },
--   on_attach = function(client, bufnr)
--     require("lvim.lsp").common_on_attach(client, bufnr)
--   end,
--   capabilities = require("lvim.lsp").common_capabilities(),
-- })

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "/home/efremov/Dev/web/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9000,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}
