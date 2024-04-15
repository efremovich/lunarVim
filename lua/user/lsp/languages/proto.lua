local lspconfig_util = require 'lspconfig.util'

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("bufls", {
  filetypes = { "proto" },
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
  end,
  capabilities = require("lvim.lsp").common_capabilities(),
  cmd = { "bufls", "serve" },
  root_dir = { lspconfig_util.root_pattern(".git", 'proto') },
})
