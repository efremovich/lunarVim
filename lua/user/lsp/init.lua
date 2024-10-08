require "user.lsp.languages.rust"
require "user.lsp.languages.go"
require "user.lsp.languages.python"
require "user.lsp.languages.js-ts"
require "user.lsp.languages.sh"
require "user.lsp.languages.emmet"
require "user.lsp.languages.css"
require "user.lsp.languages.dart"
require "user.lsp.languages.md"
require "user.lsp.languages.vue"
require "user.lsp.languages.proto"
require "user.lsp.languages.php"
require "user.lsp.languages.sql"
require "user.lsp.languages.sh"
-- require("user.lsp.handlers").setup()

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "java",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls", "snyk_ls, volar" })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
  { command = "stylua",             filetypes = { "lua" } },
  { command = "shfmt",              filetypes = { "sh", "zsh" } },
  { command = "prettier",           filetypes = { "css", "yaml" } },
  { command = "buf",                filetypes = { "proto" } },
}

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "buf", filetypes = { "proto" } },
  -- { command = "revive", filetypes = { "go" } },
}

print("DAP not found")
