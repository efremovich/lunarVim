local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "sqlfmt", filetypes = { "sql" } },
}
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "sqlfluff", args = { "--dialect", "postgres" }, filetypes = { "sql" } },
-- }

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "sqlls" })

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("sqlls", {
--   filetypes = { "sql" },
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   settings = {
--     sqls = {
--       connections = {
--         -- {
--         --   driver = "mysql",
--         --   -- dataSourceName = "root:root@tcp(127.0.0.1:13306)/world",
--         -- },
--         {
--           driver = "postgresql",
--           dataSourceName = "host=10.0.78.22 port=31100 user=oper_2ae password=g3BU(E22 dbname=operator_2ae_slave sslmode=disable",
--         },
--       },
--     },
--   },
-- })

-- require("lspconfig").sqls.setup {
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = require("lvim.lsp").common_capabilities(),
--   on_attach = function(client, bufnr)
--     require("sqls").on_attach(client, bufnr)
--   end,
--   settings = {
--     sqls = {
--       connections = {
--         -- {
--         --   driver = "mysql",
--         --   -- dataSourceName = "root:root@tcp(127.0.0.1:13306)/world",
--         -- },
--         {
--           driver = "postgresql",
--           dataSourceName = "host=10.0.78.22 port=31100 user=oper_2ae password=g3BU(E22 dbname=operator_2ae_slave sslmode=disable",
--         },
--       },
--     },
--   },
-- }

-- local sql_ok, sqlls = pcall(require, "sqlls")
-- if not sql_ok then
--   return
-- end

-- sqlls.setup()
